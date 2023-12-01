class DayTimeSlotsController < ApplicationController

  before_action :set_config_time_slot, only: %i[new]

  def new
    @day_time_slot = DaysTimeSlot.new
  end

  def create
    @day_time_slot = DaysTimeSlot.new(day_time_slot_params)
    @day_time_slot.config_time_slot = @config_time_slot
      if @day_time_slot.save
        redirect_to config_time_slot_path(@config_time_slot)
      else
        render :new, status: :unprocessable_entity
      end
  end

  private

  def set_config_time_slot
    @config_time_slot = ConfigTimeSlot.find(params[:config_time_slot_id])
  end

  def day_time_slot_params
    params.require(:day_time_slot).permit(:day, :start_time, :end_time)
  end
end
