class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :destroy]
  before_action :set_user, only: [:offered]

  def index
    @activities = Activity.all
  end

  def show
    @booking = Booking.new
    @disabled_dates = @activity.bookings.map { |booking| { from: booking.start_date, to: booking.end_date } }
    @markers = [{
      lat: @activity.latitude,
      lng: @activity.longitude
      }]
    @review = Review.new
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity.update(activity_params)
    redirect_to activity_path(@activity)
  end

  def destroy
    @activity.destroy
    redirect_to activities_path, status: other
  end

  def offered
    @activities = @user.activities
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :location, :max_people, :price, :photo_url, :category_id, :photo)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
