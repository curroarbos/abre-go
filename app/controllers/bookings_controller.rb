class BookingsController < ApplicationController
  before_action :set_activity, only: %i[new create]
  before_action :set_booking, only: %i[show edit destroy]
  before_action :set_user, only: %i[index create]

  def index
    @bookings = @user.bookings
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.activity = @activity
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :number_of_people)
  end
end
