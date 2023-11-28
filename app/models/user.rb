class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :first_name, :last_name, presence: true
  has_many :bookings
  has_many :activities
  has_many :bookings_as_provider, through: :activities, source: :bookings
  # has_many :activities, through: :bookings
  has_many :reviews, through: :activities
  has_one_attached :photo

  def provider?
    is_provider
  end
end
