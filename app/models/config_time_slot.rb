class ConfigTimeSlot < ApplicationRecord
  belongs_to :activity
  has_many :days_time_slots
end
