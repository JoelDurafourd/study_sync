class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  enum :status, { pending: 0, accepted: 1, declined: 2, canceled: 3 }

  validates :start_date, presence: true
  validates :end_date, presence: true, comparison: { greater_than: :start_date }
  validates :status, presence: true
  # validates :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date > start_date
      errors.add(:end_date,"must be after the start date")
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
