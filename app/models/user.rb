class User < ApplicationRecord
  has_many :lessons
  has_many :bookings

  validates :first_name, presence: true, length: { in: 1..100 }
  validates :last_name, presence: true, length: { in: 1..100 }
  validates :description, length: { maximum: 1000 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :lessons
end
