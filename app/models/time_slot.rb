class TimeSlot < ApplicationRecord
  belongs_to :activity
  has_one :booking

  def timeslot_display
    "#{start_time.hour}:#{start_time.min} -  #{end_time.hour}:#{end_time.min} "
  end
end
