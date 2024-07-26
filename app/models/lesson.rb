class Lesson < ApplicationRecord
  # this is the lesson module and its validations.
  # a lesson must belong to a user who is the author of the lesson, though it can contain 0 or more bookings.
  belongs_to :user
  has_many :bookings, dependent: :destroy

  # commented out the category validation because a category has to be selected on creation anyway.
  # validates :category, presence: true, length: { in: 3..55 }
  # description must contain 3 to 1000 characters
  validates :description, presence: true, length: { in: 3..1000 }
  # title must be more than 3 but less than 55 characters
  validates :title, presence: true, length: { in: 3..55 }
  # price cannot be negative numbers, but can be free
  validates :price, presence: true, numericality: { minimum: 0 }

  # can have multiple photos
  has_many_attached :photos

  # lesson search model, see PgSearch documentation for more info
  include PgSearch::Model
    pg_search_scope :search_by_category_description_title,
      against: [ :title, :category, :description ],
      associated_against: {
        user: [ :first_name, :last_name, :email ]
      },
      using: {
        tsearch: { prefix: true }
      }

  # following code contains all possible categories, which is then referenced on creation. Be warned, modifying this while there are existing lessons -
  # can cause errors.
  # the categories code is frozen so that both the program or users cannot modify categories in production.
  CATEGORIES = [
    "Programming", "Science", "Mathematics", "Music", "Languages", "Cooking",
    "Fitness", "Travel", "Art", "Nature", "Yoga",
    "Photography", "History", "Literature", "Marketing",
    "Film", "Fashion"
    ].freeze

    # validates the category inclusion with error message, though it's obsolete as user cannot input a category themselves.
    validates :category, inclusion: { in: CATEGORIES, message: "%{value} is not a valid category" }
end
