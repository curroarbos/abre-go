class Restaurant < ApplicationRecord
  has_many :recommendations, as: :recommendable

  
end
