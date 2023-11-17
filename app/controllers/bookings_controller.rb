class BookingsController < ApplicationController
  before_action :set_activity, only: %i[new create]
  before_action :set_booking, only: %i[show edit destroy]
  before_action :set_user, only: %i[index]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
