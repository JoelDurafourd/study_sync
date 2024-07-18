# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
require 'uri'

puts "Destroying Bookings...!"
Booking.destroy_all
puts "Destroying Lessons...!"
Lesson.destroy_all
puts "Destroying Users...!"
User.destroy_all

# Creating users
user1 = User.create!(email: "john.doe@email.com", password: "123456", first_name: "John", last_name: "Doe", description: "I love to play guitar, come learn with me!")
user1.photo.attach(io: URI.open(Cloudinary::Utils.cloudinary_url(Faker::Avatar.image(size: '300x300', format: 'png'))), filename: 'avatar.png')
puts "Created #{user1}!"

user2 = User.create!(email: "jane.smith@email.com", password: "password123", first_name: "Jane", last_name: "Smith", description: "Passionate about cooking and exploring new recipes.")
user2.photo.attach(io: URI.open(Cloudinary::Utils.cloudinary_url(Faker::Avatar.image(size: '300x300', format: 'png'))), filename: 'avatar.png')
puts "Created #{user2}!"

user3 = User.create!(email: "michael.jones@email.com", password: "securepass", first_name: "Michael", last_name: "Jones", description: "Tech enthusiast and avid gamer.")
user3.photo.attach(io: URI.open(Cloudinary::Utils.cloudinary_url(Faker::Avatar.image(size: '300x300', format: 'png'))), filename: 'avatar.png')
puts "Created #{user3}!"

user4 = User.create!(email: "emily.wilson@email.com", password: "p@ssw0rd", first_name: "Emily", last_name: "Wilson", description: "Fitness coach helping people achieve their goals.")
user4.photo.attach(io: URI.open(Cloudinary::Utils.cloudinary_url(Faker::Avatar.image(size: '300x300', format: 'png'))), filename: 'avatar.png')
puts "Created #{user4}!"

user5 = User.create!(email: "david.brown@email.com", password: "david123", first_name: "David", last_name: "Brown", description: "Travel blogger exploring hidden gems around the world.")
user5.photo.attach(io: URI.open(Cloudinary::Utils.cloudinary_url(Faker::Avatar.image(size: '300x300', format: 'png'))), filename: 'avatar.png')
puts "Created #{user5}!"

user6 = User.create!(email: "anna.johnson@email.com", password: "password456", first_name: "Anna", last_name: "Johnson", description: "Art enthusiast and painter.")
user6.photo.attach(io: URI.open(Cloudinary::Utils.cloudinary_url(Faker::Avatar.image(size: '300x300', format: 'png'))), filename: 'avatar.png')
puts "Created #{user6}!"

user7 = User.create!(email: "matthew.wilson@email.com", password: "securepassword", first_name: "Matthew", last_name: "Wilson", description: "Nature lover and hiking guide.")
user7.photo.attach(io: URI.open(Cloudinary::Utils.cloudinary_url(Faker::Avatar.image(size: '300x300', format: 'png'))), filename: 'avatar.png')
puts "Created #{user7}!"

user8 = User.create!(email: "sarah.davis@email.com", password: "p@ssw0rd123", first_name: "Sarah", last_name: "Davis", description: "Yoga instructor promoting wellness.")
user8.photo.attach(io: URI.open(Cloudinary::Utils.cloudinary_url(Faker::Avatar.image(size: '300x300', format: 'png'))), filename: 'avatar.png')
puts "Created #{user8}!"

user9 = User.create!(email: "peter.jackson@email.com", password: "peter123", first_name: "Peter", last_name: "Jackson", description: "Photographer capturing moments.")
user9.photo.attach(io: URI.open(Cloudinary::Utils.cloudinary_url(Faker::Avatar.image(size: '300x300', format: 'png'))), filename: 'avatar.png')
puts "Created #{user9}!"

user10 = User.create!(email: "elizabeth.moore@email.com", password: "lizzie456", first_name: "Elizabeth", last_name: "Moore", description: "History buff and tour guide.")
user10.photo.attach(io: URI.open(Cloudinary::Utils.cloudinary_url(Faker::Avatar.image(size: '300x300', format: 'png'))), filename: 'avatar.png')
puts "Created #{user10}!"

user11 = User.create!(email: "robert.smith@email.com", password: "robertpass", first_name: "Robert", last_name: "Smith", description: "Bookworm and literature enthusiast.")
user11.photo.attach(io: URI.open(Cloudinary::Utils.cloudinary_url(Faker::Avatar.image(size: '300x300', format: 'png'))), filename: 'avatar.png')
puts "Created #{user11}!"

user12 = User.create!(email: "lisa.thomas@email.com", password: "lisathomas", first_name: "Lisa", last_name: "Thomas", description: "Graphic designer passionate about visual storytelling.")
user12.photo.attach(io: URI.open(Cloudinary::Utils.cloudinary_url(Faker::Avatar.image(size: '300x300', format: 'png'))), filename: 'avatar.png')
puts "Created #{user12}!"

user13 = User.create!(email: "kevin.wong@email.com", password: "kevin123", first_name: "Kevin", last_name: "Wong", description: "Foodie exploring culinary delights.")
user13.photo.attach(io: URI.open(Cloudinary::Utils.cloudinary_url(Faker::Avatar.image(size: '300x300', format: 'png'))), filename: 'avatar.png')
puts "Created #{user13}!"

user14 = User.create!(email: "jennifer.white@email.com", password: "jenwhite", first_name: "Jennifer", last_name: "White", description: "Marketing expert and business strategist.")
user14.photo.attach(io: URI.open(Cloudinary::Utils.cloudinary_url(Faker::Avatar.image(size: '300x300', format: 'png'))), filename: 'avatar.png')
puts "Created #{user14}!"

user15 = User.create!(email: "george.baker@email.com", password: "baker456", first_name: "George", last_name: "Baker", description: "Film buff and cinema historian.")
user15.photo.attach(io: URI.open(Cloudinary::Utils.cloudinary_url(Faker::Avatar.image(size: '300x300', format: 'png'))), filename: 'avatar.png')
puts "Created #{user15}!"

user16 = User.create!(email: "natalie.green@email.com", password: "natalie123", first_name: "Natalie", last_name: "Green", description: "Environmental activist promoting sustainability.")
user16.photo.attach(io: URI.open(Cloudinary::Utils.cloudinary_url(Faker::Avatar.image(size: '300x300', format: 'png'))), filename: 'avatar.png')
puts "Created #{user16}!"

user17 = User.create!(email: "william.roberts@email.com", password: "william456", first_name: "William", last_name: "Roberts", description: "Music producer and audio engineer.")
user17.photo.attach(io: URI.open(Cloudinary::Utils.cloudinary_url(Faker::Avatar.image(size: '300x300', format: 'png'))), filename: 'avatar.png')
puts "Created #{user17}!"

user18 = User.create!(email: "olivia.martin@email.com", password: "olivia123", first_name: "Olivia", last_name: "Martin", description: "Fashion designer creating unique styles.")
user18.photo.attach(io: URI.open(Cloudinary::Utils.cloudinary_url(Faker::Avatar.image(size: '300x300', format: 'png'))), filename: 'avatar.png')
puts "Created #{user18}!"

user19 = User.create!(email: "samuel.anderson@email.com", password: "samuel456", first_name: "Samuel", last_name: "Anderson", description: "Entrepreneur and startup mentor.")
user19.photo.attach(io: URI.open(Cloudinary::Utils.cloudinary_url(Faker::Avatar.image(size: '300x300', format: 'png'))), filename: 'avatar.png')
puts "Created #{user19}!"

user20 = User.create!(email: "sophia.thompson@email.com", password: "sophia123", first_name: "Sophia", last_name: "Thompson", description: "Language enthusiast learning new languages.")
user20.photo.attach(io: URI.open(Cloudinary::Utils.cloudinary_url(Faker::Avatar.image(size: '300x300', format: 'png'))), filename: 'avatar.png')
puts "Created #{user20}!"

# Create lessons for each user
lesson1 = user1.lessons.create!(
  category: "Music",
  description: "Learn to play guitar with basic chords and techniques.",
  title: "Guitar Basics",
  price: 29.99
)
puts "Created #{lesson1}!"

lesson2 = user2.lessons.create!(
  category: "Cooking",
  description: "Learn to cook delicious meals from scratch!",
  title: "Mastering Culinary Arts",
  price: 59.99
)
puts "Created #{lesson2}!"

lesson3 = user3.lessons.create!(
  category: "Technology",
  description: "Introduction to programming with Python.",
  title: "Python Programming Fundamentals",
  price: 49.99
)
puts "Created #{lesson3}!"

lesson4 = user4.lessons.create!(
  category: "Fitness",
  description: "Custom workout plans tailored to your fitness goals.",
  title: "Personalized Fitness Training",
  price: 39.99
)
puts "Created #{lesson4}!"

lesson5 = user5.lessons.create!(
  category: "Travel",
  description: "Discover hidden travel destinations off the beaten path.",
  title: "Exploring Hidden Gems",
  price: 19.99
)
puts "Created #{lesson5}!"

lesson6 = user6.lessons.create!(
  category: "Art",
  description: "Explore painting techniques and unleash your creativity.",
  title: "Artistic Expression",
  price: 44.99
)
puts "Created #{lesson6}!"

lesson7 = user7.lessons.create!(
  category: "Nature",
  description: "Guided hikes to explore the beauty of nature.",
  title: "Nature Discovery",
  price: 34.99
)
puts "Created #{lesson7}!"

lesson8 = user8.lessons.create!(
  category: "Yoga",
  description: "Learn yoga poses and techniques for a balanced lifestyle.",
  title: "Yoga for Wellness",
  price: 49.99
)
puts "Created #{lesson8}!"

lesson9 = user9.lessons.create!(
  category: "Photography",
  description: "Master the art of photography and capture stunning moments.",
  title: "Photography Mastery",
  price: 69.99
)
puts "Created #{lesson9}!"

lesson10 = user10.lessons.create!(
  category: "History",
  description: "Explore historical landmarks and stories from the past.",
  title: "Historical Tours",
  price: 39.99
)
puts "Created #{lesson10}!"

lesson11 = user11.lessons.create!(
  category: "Literature",
  description: "Dive into classic literature and modern novels.",
  title: "Literary Exploration",
  price: 29.99
)
puts "Created #{lesson11}!"

lesson12 = user12.lessons.create!(
  category: "Design",
  description: "Learn graphic design principles and create visual stories.",
  title: "Graphic Design Essentials",
  price: 54.99
)
puts "Created #{lesson12}!"

lesson13 = user13.lessons.create!(
  category: "Food",
  description: "Explore culinary delights and master cooking techniques.",
  title: "Culinary Delights",
  price: 59.99
)
puts "Created #{lesson13}!"

lesson14 = user14.lessons.create!(
  category: "Marketing",
  description: "Strategies for effective marketing and business growth.",
  title: "Marketing Mastery",
  price: 79.99
)
puts "Created #{lesson14}!"

lesson15 = user15.lessons.create!(
  category: "Film",
  description: "Discover the evolution of cinema and iconic films.",
  title: "Cinematic Journey",
  price: 39.99
)
puts "Created #{lesson15}!"

lesson16 = user16.lessons.create!(
  category: "Environment",
  description: "Promote sustainability and protect our environment.",
  title: "Environmental Awareness",
  price: 29.99
)
puts "Created #{lesson16}!"

lesson17 = user17.lessons.create!(
  category: "Music",
  description: "Produce music tracks and learn audio engineering.",
  title: "Music Production",
  price: 49.99
)
puts "Created #{lesson17}!"

lesson18 = user18.lessons.create!(
  category: "Fashion",
  description: "Create unique fashion styles and trends.",
  title: "Fashion Design",
  price: 69.99
)
puts "Created #{lesson18}!"

lesson19 = user19.lessons.create!(
  category: "Business",
  description: "Start and grow successful businesses with strategic insights.",
  title: "Startup Success",
  price: 89.99
)
puts "Created #{lesson19}!"

lesson20 = user20.lessons.create!(
  category: "Languages",
  description: "Learn new languages and expand your communication skills.",
  title: "Language Learning Journey",
  price: 34.99
)
puts "Created #{lesson20}!"
