class Booking < ApplicationRecord
  # this is the booking module and its validations.

  # t.datetime "start_date"
  # t.datetime "end_date"
  # t.integer "status", default: 0
  # t.bigint "user_id", null: false
  # t.bigint "lesson_id", null: false

  # it must have a user and a lesson in order to be created
  belongs_to :user
  belongs_to :lesson
  # the booking must contain a status, default is 0
  enum :status, { pending: 0, accepted: 1, declined: 2, canceled: 3 }

  # validations whose meaning is obvious
  validates :start_date, presence: true
  validates :end_date, presence: true, comparison: { greater_than: :start_date }
  validates :status, presence: true

  # Custom validation method
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    # the end date must be after the start date 
    return if end_date.blank? || start_date.blank?

    if end_date <= start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end

# class Bookmark < ApplicationRecord
#   validates :movie, presence: true
#   validates :list, presence: true
#   validates :comment, length: { minimum: 6 }
#   validates :movie, uniqueness: { scope: :list, message: "you already added this bookmark" }
#   belongs_to :movie
#   belongs_to :list
# end
