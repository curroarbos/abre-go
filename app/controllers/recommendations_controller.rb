class RecommendationsController < ApplicationController
  def index
    @recommendations = Recommendation.where(property_id: params[:property_id])
  end

  def new
    @property = Property.find(params[:property_id])
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

  private

  def recommendation_params
    params.require(:recommendation).permit(:recommendable)
  end
end
