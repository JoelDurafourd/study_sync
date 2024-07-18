class User < ApplicationRecord
  has_many :lessons, dependent: :destroy
  has_many :bookings, dependent: :destroy

  # validates :first_name, presence: true, length: { in: 1..100 }
  # validates :last_name, presence: true, length: { in: 1..100 }
  validates :description, length: { maximum: 1000 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :lessons

  has_one_attached :photo

  def booking_requests
    bookings.where(lesson: lessons)
  end
end
