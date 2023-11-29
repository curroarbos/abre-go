require 'uri'
require 'net/http'
require 'cgi'
require 'json'

class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]

  def show
    @markers = [{
      lat: @restaurant.latitude,
      lng: @restaurant.longitude
      }]
  end

  def new
  end

  def create
    # Instantiate the Restaurant
    @restaurant = Restaurant.new
    # Fetch the API to retrieve the restaurant details
    places_id = params[:place_id]
    url = URI("https://local-business-data.p.rapidapi.com/business-details?business_id=#{places_id}&extract_emails_and_contacts=true&extract_share_link=true&region=eu&language=en")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = ENV["BUSINESS_LOCAL_DATA_KEY"]
    request["X-RapidAPI-Host"] = 'local-business-data.p.rapidapi.com'

    response = http.request(request).read_body

    details = JSON.parse(response)

    @restaurant.name = details["data"][0]["name"]
    @restaurant.address = details["data"][0]["address"]
    @restaurant.latitude = details["data"][0]["latitude"]
    @restaurant.longitude = details["data"][0]["longitude"]
    @restaurant.rating = details["data"][0]["rating"]
    @restaurant.review_count = details["data"][0]["review_count"]
    @restaurant.telephone_number = details["data"][0]["phone_number"]
    @restaurant.google_link = details["data"][0]["share_link"]
    @restaurant.photo_url = details["data"][0]["photos_sample"][0]["photo_url"]

    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
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
