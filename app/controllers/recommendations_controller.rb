class RecommendationsController < ApplicationController

  before_action :set_property, only: [:index]
  def index
    @recommendations = Recommendation.where(property_id: params[:property_id])

  end

  def new
    @property = Property.find(params[:property_id])
    @recommendations = Recommendation.where(property_id: params[:property_id])
    @recommendation = Recommendation.new
    @activities = Activity.all
  end

  def create
    # raise
    @property = Property.find(params[:property_id])
    params[:recommendation][:recommendable][1..].each do |activity_id|
      activity = Activity.find(activity_id)
      @recommendation = Recommendation.new(recommendable: activity)
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
