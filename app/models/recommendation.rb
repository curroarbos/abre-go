class Recommendation < ApplicationRecord
  belongs_to :property
  belongs_to :recommendable, polymorphic: true
end
