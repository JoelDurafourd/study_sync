class Lesson < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :category, presence: true, length: { in: 3..55 }
  validates :description, presence: true, length: { in: 3..1000 }
  validates :title, presence: true, length: { in: 3..55 }
  validates :price, presence: true, numericality: { minimum: 0 }
end
