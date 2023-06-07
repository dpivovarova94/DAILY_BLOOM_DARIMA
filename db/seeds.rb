# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require 'json'


puts 'Cleaning database'

User.destroy_all

test_user = User.create!(
  email: "test@mail.de",
  password: "123456"
)

Category.create!(name: "Nature")
Category.create!(name: "Art")
Category.create!(name: "Animals")


Keyword.create!(
  name: "Flower",
  category: Category.find_by(name: "Nature")
)

Keyword.create!(
  name: "Sky",
  category: Category.find_by(name: "Nature")
)

Keyword.create!(
  name: "Blue",
  category: Category.find_by(name: "Art")
)

Keyword.create!(
  name: "Paintings",
  category: Category.find_by(name: "Art")
)

Keyword.create!(
  name: "Dogs",
  category: Category.find_by(name: "Animals")
)

Keyword.create!(
  name: "Cats",
  category: Category.find_by(name: "Animals")
)

puts 'keywords added'

# faking users with faker gem
10.times do
  User.create!(
    # first_name: Faker::Name.first_name,
    # last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    # location: Faker::Address.city,
    avatar_url: Faker::Avatar.image,
    password: "123456"
  )
end

puts "users created"

Toni = User.create(
  email: "toni@mail.de",
  avatar_url: Faker::Avatar.image,
  password: "123456"
)

puts 'toni created'

A = User.create(
  email: "a@a.a",
  avatar_url: Faker::Avatar.image,
  password: "aaaaaa"
)

puts 'a created as well'


# Assuming you have Keyword and User models defined

# Create some sample challenges
10.times do
  Challenge.create!(
    keyword_id: Keyword.pluck(:id).sample,
    user_id: User.pluck(:id).sample,
    start_date: Faker::Date.forward(days: 30)
  )
end

puts 'now we have Challenge'



30.times do
  Post.create!(
    date: Faker::Date.backward(days: 30),
    # lines below add 1 randome cotent
    # song_url: rand(0..1) == 0 ? Faker::Internet.url : nil,
    # poem: rand(0..1) == 0 ? Faker::Lorem.paragraph : nil,
    # text: rand(0..1) == 0 ? Faker::Lorem.sentence : nil, add to next line rand(0..1) == 0 ? and : nil, after image
    picture_url: Faker::LoremFlickr.image,
    medium: Faker::Lorem.word,
    #gets randome ids from the previous created challenge id
    challenge_id: Challenge.pluck(:id).sample
  )
end

puts 'post posted hehe '

sleep 2

puts 'omg enjoy the seeds'

sleep 1

puts '✧ ♡ ( ◕ ‿ ◕ ✿ )'
