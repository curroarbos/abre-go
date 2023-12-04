class Recommendation < ApplicationRecord
  belongs_to :property
  belongs_to :recommendable, polymorphic: true

  # These are used in the JavaScript to keep track of the selected activities and restaurants
  attr_accessor :activity_ids
  attr_accessor :restaurant_ids
end
