class BookingsController < ApplicationController
  before_action :set_activity, only: %i[new create]
  before_action :set_booking, only: %i[show update destroy]
  before_action :set_user, only: %i[index create requested]

  def index
    @bookings = @user.bookings
  end

  def show
  end

  def new
    @booking = Booking.new
    @disabled_dates = @activity.bookings.map { |booking| { from: booking.start_date, to: booking.end_date } }
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.activity = @activity
    # if @booking.valid?
      if @booking.save
        redirect_to bookings_path
      else
        render :new, status: :unprocessable_entity
      end
    # else
    #   render "activities/show", status: :unprocessable_entity
    # end
  end

  def requested
    @bookings = @user.bookings_as_provider
  end

  def edit
  end

  def update
    @booking.update(status: params[:status])
    redirect_to requested_path(current_user)
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
    params.require(:booking).permit(:start_date, :end_date, :number_of_people, :status)
  end
end
