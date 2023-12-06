class ConfigTimeSlotsController < ApplicationController
  before_action :set_activity, only: %i[new create]
  before_action :set_config_time_slot, only: %i[show]
  before_action :set_days_time_slots, only: %i[show]

  def show
    @activity = @config_time_slot.activity

  end

  def new
    @config_time_slot = ConfigTimeSlot.new
  end

  def create
    @config_time_slot = ConfigTimeSlot.new(config_time_slot_params)
    @config_time_slot.activity = @activity
    if @config_time_slot.save
      redirect_to config_time_slot_path(@config_time_slot)
    else
      render :new, status: :unprocessable_entity
    end
  end



  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def set_config_time_slot
    @config_time_slot = ConfigTimeSlot.find(params[:id])
  end

  def config_time_slot_params
    params.require(:config_time_slot).permit(:frequency)
  end

  def set_days_time_slots
    @days_time_slots = @config_time_slot.days_time_slots
  end
end
