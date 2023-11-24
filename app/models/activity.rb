class Activity < ApplicationRecord
  has_many :bookings
  has_many :reviews
  belongs_to :user
  belongs_to :category
  has_one_attached :photo
  # has_many :users, through: :reviews
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def method_name
    
  end
end
