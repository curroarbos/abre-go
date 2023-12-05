class TimeSlot < ApplicationRecord
  belongs_to :activity
  has_one :booking

end
