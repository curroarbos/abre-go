require 'uri'
require 'net/http'
require 'cgi'
require 'json'

class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    places_id = params[:place_id]
    url = URI("https://local-business-data.p.rapidapi.com/business-details?business_id=#{places_id}&extract_emails_and_contacts=true&extract_share_link=true&region=eu&language=en")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = '8065d585f3msh6fc7bc0e2d4fa2dp1925fajsna889c96982de'
    request["X-RapidAPI-Host"] = 'local-business-data.p.rapidapi.com'

    response = http.request(request).read_body

    details = JSON.parse(response)

    raise

    @restaurant.name = current_user
    if @restaurant.save
      redirect_to activity_path(@restaurant)
      current_user.update(is_provider: true)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:search_name)
  end
end
