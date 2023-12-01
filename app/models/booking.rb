class Booking < ApplicationRecord
  # STATUSES = %w(pending rejected accepted)
  belongs_to :activity
  belongs_to :user
  belongs_to :property
  belongs_to :time_slot
  # scope :status, -> { where(status: nil) }
end
