class Lesson < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :category, presence: true, length: { in: 3..55 }
  validates :description, presence: true, length: { in: 3..1000 }
  validates :title, presence: true, length: { in: 3..55 }
  validates :price, presence: true, numericality: { minimum: 0 }

  has_many_attached :photos

  include PgSearch::Model
    pg_search_scope :search_by_category_description_title,
      against: [ :title, :category, :description ],
      associated_against: {
        user: [ :first_name, :last_name, :email ]
      },
      using: {
        tsearch: { prefix: true }
      }
end
