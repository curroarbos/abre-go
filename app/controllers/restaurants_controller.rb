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

    @restaurant.enrich(url)

    if @restaurant.save
      redirect_to new_property_recommendation_path(params[:property_id], some: 'restaurants')
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
