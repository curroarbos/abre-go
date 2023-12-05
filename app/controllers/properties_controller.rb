require "json"
require "open-uri"

class PropertiesController < ApplicationController

  def index
    @properties = Property.where(user: current_user)
  end

  def show
    # Have the user_id only
    @property = Property.find(params[:id])
    @recommendations = Recommendation.where(property_id: @property.id)
    @inhouse_recommendations = @recommendations.select { |recommendation|
      recommendation.recommendable_type == "Activity" && recommendation.recommendable.in_house
    }
    # Is there a way to exclude all the in_house recommendations from the @outdoor_recommendations?
    @outdoor_recommendations = @recommendations.select { |recommendation|
      recommendation.recommendable_type == "Activity" && recommendation.recommendable.in_house == false
    }
    @restaurant_recommendations = @recommendations.select { |recommendation|
      recommendation.recommendable_type == "Restaurant"
    }
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new

    full_url = params[:property][:embedded_link]
    match_data = full_url.match(/https:\/\/www.airbnb.com\/rooms\/(\d+)/)
    property_id = match_data[1]
    url = URI("https://airbnb-data.p.rapidapi.com/WebAPIs/airbnb/detail?id=#{property_id}&locale=en&currency=USD")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = ENV["AIRBNB_RAPID_API_KEY"]
    request["X-RapidAPI-Host"] = 'airbnb-data.p.rapidapi.com'
    response = http.request(request).read_body
    details = JSON.parse(response)

    lat = details["data"]["metadata"]["loggingContext"]["eventDataLogging"]["listingLat"]
    lng = details["data"]["metadata"]["loggingContext"]["eventDataLogging"]["listingLng"]
    @property.name = details["data"]["metadata"]["seoFeatures"]["ogTags"]["ogDescription"]
    @property.photo = details["data"]["metadata"]["sharingConfig"]["imageUrl"]
    @property.location = "#{lat},#{lng}"
    @property.embedded_link = full_url
    @property.user = current_user

    if @property.save
      redirect_to property_path(@property)
      current_user.update(is_owner: true)
    else
      render :new
    end
  end

  private

  def property_params
    params.require(:property).permit(:name, :location, :embedded_link)
  end
end
