class RecommendationsController < ApplicationController

  before_action :set_property, only: [:index]
  def index
    @recommendations = Recommendation.where(property_id: params[:property_id])
  end

  def new
    @property = Property.find(params[:property_id])
    @recommendations = Recommendation.where(property_id: params[:property_id])
    @recommendation = Recommendation.new

    # This is splits the previous recommendations into inhouse and outdoor
    if params[:some] == "in_house"
      @recommendations = @recommendations.select { |recommendation|
        recommendation.recommendable_type == "Activity" && recommendation.recommendable.in_house
      }
    elsif params[:some] == "outdoor"
      @recommendations = @recommendations.select { |recommendation|
        recommendation.recommendable_type == "Activity" && recommendation.recommendable.in_house == false
      }
    elsif params[:some] == "restaurants"
      @recommendations = @recommendations.select { |recommendation|
        recommendation.recommendable_type == "Restaurant"
      }
    end

    # This splits the activities and restaurants into inhouse or outdoor
    if params[:some] == "in_house"
      @activities = Activity.all.where(in_house: true)
      if params[:query].present?
        @activities = PgSearch.multisearch(params[:query]).select { |result|
          result.searchable_type == "Activity"
        }
        @activities = @activities.map { |result| result.searchable }
      end
    elsif params[:some] == "outdoor"
      @activities = Activity.all.where(in_house: false)
      if params[:query].present?
        @activities = PgSearch.multisearch(params[:query]).select { |result|
          result.searchable_type == "Activity"
        }
        @activities = @activities.map { |result| result.searchable }
      end
    elsif params[:some] == "restaurants"
      @restaurants = Restaurant.all
      if params[:query].present?
        @restaurants = PgSearch.multisearch(params[:query]).select { |result|
          result.searchable_type == "Restaurant"
        }
        @restaurants = @restaurants.map { |result| result.searchable }
      end
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
    redirect_to request.referrer
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:recommendable)
  end

  def set_property
    @property = Property.find(params[:property_id])
  end

end
