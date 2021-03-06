# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  'Kavish R Munjal',
             email: 'kavish@dwidder.org',
             handle: 'kavisherlock',
             password: 'kavish',
             password_confirmation: 'kavish',
             admin: true)

User.create!(name:  'Claire Grogan',
             email: 'clairy@dwidder.org',
             handle: 'clairebear',
             password: 'kavish',
             password_confirmation: 'kavish',
             admin: true)

49.times do |n|
  name  = Faker::Name.name
  email = "user-#{n + 1}@dwidder.org"
  handle = "user-#{n + 1}"
  password = 'kavish'
  User.create!(name:  name,
               email: email,
               handle: handle,
               password: password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.dweeds.create!(content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followee| user.follow(followee) }
followers.each { |follower| follower.follow(user) }
