class BookingsController < ApplicationController
  before_action :set_activity, only: %i[create]
  before_action :set_booking, only: %i[show update destroy]
  before_action :set_user, only: %i[index create requested]
  before_action :set_property, only: %i[ create ]

  def index
    @bookings = @user.bookings
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.activity = @activity
    @booking.time_slot.update(booked:true)
    @booking.property = @property
    if @booking.save
      redirect_to bookings_path(property_id: params[:booking][:property_id])
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
    if @booking.status == false
      @booking.time_slot.update(booked: false)
    end
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

  def set_property
    @property = Property.find(params[:booking][:property_id])
  end

  def booking_params
    params.require(:booking).permit(:day, :number_of_people, :time_slot_id)
  end
end
