require "json"

class TimeSlotsController < ApplicationController
  before_action :set_activity, only: %i[create]
  before_action :set_config_time_slot, only: %i[create]
  before_action :set_days_time_slots, only: %i[create]
  before_action :set_user, only: %i[create]

  def create
    @activity.time_slots.where("booked=false").destroy_all
    @days_time_slots.each do |days_time_slot|
      today = Date.today
      8.times do
        JSON.parse(days_time_slot.day).each do |day|
          time = days_time_slot.start_time
          days_time_slot.frequency.times do
            @time_slot = TimeSlot.new
            @time_slot.activity = @activity
            start_time = DateTime.parse("#{today.next_occurring(day.downcase.to_sym)}, #{time.hour}:#{time.min}")
            @time_slot.start_time = start_time
            end_time = start_time + Rational(@activity.duration, 24)
            @time_slot.end_time = end_time
            time = end_time + days_time_slot.interval.minutes
            @time_slot.save
          end
        end
        today += 7.days
      end
    end
    redirect_to offered_path(@user)
  end


  private

  def set_config_time_slot
    @config_time_slot = ConfigTimeSlot.find(params[:config_time_slot_id])
  end

  def set_activity
    @config_time_slot = ConfigTimeSlot.find(params[:config_time_slot_id])
    @activity = @config_time_slot.activity
  end


  def set_days_time_slots
    @days_time_slots = @config_time_slot.days_time_slots
  end

  def set_user
    @user = current_user
  end
end
