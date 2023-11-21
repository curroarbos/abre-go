class Booking < ApplicationRecord
  belongs_to :activity, :user
end
