class User < ApplicationRecord
  # this is the user model, though warning that this is paired with devise which may conlfict with information stored here.
  # important note, all files within the devise folder was created by the devise gem and should not be modified without checking documentation. 

  # if any user is deleted, it will delete all coresponding lessons and bookings that this user has created.
  has_many :lessons, dependent: :destroy
  has_many :bookings, dependent: :destroy

  # neccesity for a first name and last name for a user, which you can modify just by commenting it out if its no longer required.
  validates :first_name, presence: true, length: { in: 1..100 }
  validates :last_name, presence: true, length: { in: 1..100 }
  validates :description, length: { maximum: 1000 }

  # devise stuff do not touch without reading devise documentation
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :lessons

  # only one user profile photo at one time
  has_one_attached :photo

  def booking_requests
    # i dont remember what this is for
    bookings.where(lesson: lessons)
  end
end
