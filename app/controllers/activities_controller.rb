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
  end

  def destroy
  end

  def update
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :description, :category, :price, :address, :photo)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
