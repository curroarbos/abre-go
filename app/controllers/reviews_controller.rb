class ReviewsController < ApplicationController

  def create
    @booking = Booking.new
    @review = Review.new(review_params)
    @activity = Activity.find(params[:activity_id])
    @review.activity = @activity
    @review.user = current_user
    if @review.save
      redirect_to activity_path(@activity, property_id: @property || params[:property_id])
    else
      render 'activities/show', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :activity_id)
  end
end
