class Activity < ApplicationRecord
  has_many :bookings
  has_many :reviews
  has_many :recommendations, as: :recommendable
  has_one :config_time_slot
  belongs_to :user
  belongs_to :category
  has_one_attached :photo
  # has_many :users, through: :reviews
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_many :time_slots

  # include PgSearch::Model
  # multisearchable against: [:title, :location, :category_id]
  include PgSearch::Model
  pg_search_scope :search_by_keyword,
    against: [ :title, :location ],
    associated_against: {
      category: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }
  multisearchable against: [:title, :location]

  # pg_search_scope :search_by_keyword,
  # against: [ :title, :location],
  # using: {
  #   tsearch: { prefix: true }
  # }

    # This is the logic for the recommendations search bar
    # include PgSearch::Model÷
end
