class TimeSlot < ApplicationRecord
  belongs_to :activities
  has_one :booking
end
