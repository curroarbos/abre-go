class ConfigTimeSlot < ApplicationRecord
  belongs_to :activities
  has_many :days_time_slots
end
