class Property < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :recommendations, as: :recommendable
end
