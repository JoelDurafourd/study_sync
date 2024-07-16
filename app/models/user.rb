class User < ApplicationRecord
<<<<<<< HEAD
  has_many :lessons
  has_many :bookings

  validates :first_name, presence: true, length: { in: 1..100 }
  validates :last_name, presence: true, length: { in: 1..100 }
  validates :description, length: { maximum: 1000 }
=======
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
>>>>>>> 8688f4aeb05d75942f755432491f3bbd3cb56fbb
end
