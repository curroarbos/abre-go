class Booking < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  belongs_to :property
  belongs_to :time_slot
  validates :time_slot, presence: true
end
