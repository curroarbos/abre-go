class Recommendation < ApplicationRecord
  belongs_to :property
  belongs_to :recommendable, polymorphic: true

  # These are used in the JavaScript to keep track of the selected activities and restaurants
  attr_accessor :activity_ids
  attr_accessor :restaurant_ids

  # include PgSearch::Model
  # multisearchable against: [:title, :location]
  include PgSearch::Model
  pg_search_scope :search_by_keyword,
  against: [ :title, :location ],
  using: {
    tsearch: { prefix: true }
  }
end
