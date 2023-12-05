class Api::V1::TimeSlotsController < Api::V1::BaseController
  before_action :set_activity, only: %i[index]
  before_action :set_date, only: %i[index]

  def index
    @time_slots = @activity.time_slots.select do |slot|
      slot.start_time.to_date == @date &&  slot.booked == false && slot.start_time > DateTime.now.utc
    end
    @time_slots = @time_slots.sort
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def set_date
    @date = Date.parse(params[:date])
  end
end
