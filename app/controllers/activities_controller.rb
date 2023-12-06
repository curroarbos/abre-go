class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_activity, only: [:show, :destroy, :update]
  # before_action :set_user, only: [:offered]

  def index
    @activities =
    if params[:query].present?
      Activity.search_by_keyword(params[:query])
    else
      Activity.all
    end
    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {activity: activity})
      }
    end
  end

  def show
    @time_slot = TimeSlot.new
    @property = Property.find(params[:property_id]) if params[:property_id]
    @booking = Booking.new
    @markers = [{
      lat: @activity.latitude,
      lng: @activity.longitude
      }]
    @review = Review.new
    @provider = @activity.user
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    if @activity.save
      redirect_to new_activity_config_time_slot_path(@activity)
      current_user.update(is_provider: true)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity.update(activity_params)
    redirect_to offered_path
  end

  def destroy
    @activity.config_time_slot.days_time_slots.destroy_all unless @activity.config_time_slot.nil?
    @activity.config_time_slot.destroy unless @activity.config_time_slot.nil?
    @activity.time_slots.destroy_all unless @activity.time_slots.nil?
    @activity.destroy
    redirect_to offered_path, status: :see_other
  end

  def offered
    @user = current_user
    @activities = @user.activities
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :location, :description, :max_people, :price, :photo_url, :category_id, :photo, :property_id, :duration, :in_house)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def set_user
    @user = current_user
  end
end
