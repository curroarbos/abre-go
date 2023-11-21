class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :destroy]

  def index
    @activities = Activity.all
  end

  def show
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

  private

  def activity_params
    params.require(:activity).permit(:title, :location, :max_people, :price, :photo_url)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
