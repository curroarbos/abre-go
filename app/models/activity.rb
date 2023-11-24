class Activity < ApplicationRecord
  has_many :bookings
  has_many :reviews
  belongs_to :user
  belongs_to :category
  has_one_attached :photo
  # has_many :users, through: :reviews
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
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

  # pg_search_scope :search_by_keyword,
  # against: [ :title, :location],
  # using: {
  #   tsearch: { prefix: true }
  # }
end
