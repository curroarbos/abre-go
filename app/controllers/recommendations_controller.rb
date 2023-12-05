class RecommendationsController < ApplicationController

  before_action :set_property, only: [:index]
  def index
    @recommendations = Recommendation.where(property_id: params[:property_id])
  end

  def new
    @property = Property.find(params[:property_id])
    @recommendations = Recommendation.where(property_id: params[:property_id])
    if params[:some] == "in_house"
      @recommendations = @recommendations.select { |recommendation|
        recommendation.recommendable_type == "Activity" && recommendation.recommendable.in_house
      }
    elsif params[:some] == "outdoor"
      @recommendations = @recommendations.select { |recommendation|
        recommendation.recommendable_type == "Activity" && recommendation.recommendable.in_house == false || recommendation.recommendable_type == "Restaurant"
      }
    end
    @recommendation = Recommendation.new
    if params[:some] == "in_house"
      @activities = Activity.all.where(in_house: true)
    elsif params[:some] == "outdoor"
      @activities = Activity.all.where(in_house: false)
      @restaurants = Restaurant.all
    end
  end

  def create
    @property = Property.find(params[:property_id])
    activity_ids = params[:recommendation][:activity_ids].split(",")
    activity_ids.map(&:to_i).sort!
    activity_ids.select! { |activity_id| activity_ids.count(activity_id) % 2 != 0 }
    activity_ids.uniq!
    activity_ids.each do |activity_id|
      activity = Activity.find(activity_id)
      @recommendation = Recommendation.new(recommendable: activity)
      @recommendation.property = @property
      @recommendation.save
    end

    restaurant_ids = params[:recommendation][:restaurant_ids].split(",")
    p "restaurant_ids: #{restaurant_ids}"
    restaurant_ids.map(&:to_i).sort!
    restaurant_ids.select! { |restaurant_id| restaurant_ids.count(restaurant_id) % 2 != 0 }
    restaurant_ids.uniq!
    restaurant_ids.each do |restaurant_id|
      restaurant = Restaurant.find(restaurant_id)
      @recommendation = Recommendation.new(recommendable: restaurant)
      @recommendation.property = @property
      @recommendation.save
    end
    # if @recommendation.save
    redirect_to property_path(@property)
    # else
    #   render :new
    # end
  end

  def destroy
    @recommendation = Recommendation.find(params[:id])
    @recommendation.destroy
    redirect_to new_property_recommendation_path(@recommendation.property)
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:recommendable)
  end

  def set_property
    @property = Property.find(params[:property_id])
  end


end
