class Booking < ApplicationRecord
  # STATUSES = %w(pending rejected accepted)
  belongs_to :activity, :user
  scope :status, -> { where(status: nil) }
end
