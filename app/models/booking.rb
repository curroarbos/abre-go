class Booking < ApplicationRecord
  # STATUSES = %w(pending rejected accepted)
  belongs_to :activity
  belongs_to :user
  # scope :status, -> { where(status: nil) }
end
