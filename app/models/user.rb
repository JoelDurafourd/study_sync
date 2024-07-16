class User < ApplicationRecord
  has_many :lessons
  has_many :bookings

  validates :first_name, presence: true, length: { in: 1..100 }
  validates :last_name, presence: true, length: { in: 1..100 }
  validates :description, length: { maximum: 1000 }
end
