class Recommendation < ApplicationRecord
  belongs_to :property
  belongs_to :recommendable, polymorphic: true

  attr_accessor :activity_ids
end