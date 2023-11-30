class RecommendationsController < ApplicationController
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
    activity_ids = params[:recommendation][:activity_ids].split(",")
    p "activity_ids: #{activity_ids}"
    activity_ids.map(&:to_i).sort!
    activity_ids.select! { |activity_id| activity_ids.count(activity_id) % 2 != 0 }
    activity_ids.uniq!
    activity_ids.each do |activity_id|
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
end
