class Booking < ApplicationRecord
  # STATUSES = %w(pending rejected accepted)
  belongs_to :activity
  belongs_to :user
  belongs_to :property
  # scope :status, -> { where(status: nil) }
  validates :start_date, presence: true
  validates :end_date, presence: true

  def valid?
    end_date > start_date
  end
end
