class DaysTimeSlotsController < ApplicationController

  before_action :set_config_time_slot, only: %i[new create]
  before_action :set_days_time_slot, only: %i[destroy]

  def new
    @days_time_slot = DaysTimeSlot.new
  end

  def create
    @days_time_slot = DaysTimeSlot.new(days_time_slot_params)
    @days_time_slot.config_time_slot = @config_time_slot
    if @days_time_slot.save
      redirect_to config_time_slot_path(@config_time_slot)
      else
        render :new, status: :unprocessable_entity
      end
  end

  def destroy
    @days_time_slot.destroy
    @config_time_slot = @days_time_slot.config_time_slot
    redirect_to config_time_slot_path(@config_time_slot)
  end

  private

  def set_config_time_slot
    @config_time_slot = ConfigTimeSlot.find(params[:config_time_slot_id])
  end

  def days_time_slot_params
    params.require(:days_time_slot).permit(:start_time, :interval, :frequency, day: [])
  end

  def set_days_time_slot
    @days_time_slot = DaysTimeSlot.find(params[:id])
  end
end
