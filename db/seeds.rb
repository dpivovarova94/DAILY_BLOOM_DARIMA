# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require 'json'

Post.destroy_all
Challenge.destroy_all
User.destroy_all
UserCategory.destroy_all
Keyword.destroy_all
Category.destroy_all
puts "database cleaned 🧹"


# SEEDS FOR DEMO

axel = User.create(
  username: "Axel",
  email: "axel@bloom.com",
  password: "123456",
  avatar_url: "https://i.pinimg.com/564x/10/6c/6d/106c6d6f853de5a16675a6db4f9ba10a.jpg"
)

alex = User.create(
  username: "Alex",
  email: "alex@bloom.com",
  password: "123456",
  avatar_url: "https://i.pinimg.com/564x/1f/93/86/1f93869e69ad108d17718b3051ef94e6.jpg"
)

# Seed Users
# user = User.create(
#   username: "Lilly",
#   email: "lilly@bloom.com",
#   password: "123456"
# )

# user2 = User.create(
#   username: "Rose",
#   email: "rose@bloom.com",
#   password: "123456"
# )

puts "test user created"

# Seed Categories
categories = ["Nature", "Harry Potter", "Art", "Food", "Human Connection", "Animals", "Garden", "Country Life", "Spirituality", "Universe", "Fashion", "Adventure", "Travel", "Harmony", "Nostalgia", "Euphoria", "Reflection", "Paradox"]
categories.each do |category_name|
  category = Category.create!(name: category_name)
  puts "Category created: #{category.name}"
end

# Seed Keywords: only for Demo, all Categories will have Keyword 'Lumos'

keywords_nature = ["Sky", "Sun", "Moon", "Flowers", "Water", "Clouds", "Beach", "Trees"]
keywords_nature.each do |keyword_name|
  Keyword.create!(
    name: keyword_name,
    category: Category.find_by(name: "Nature")
  )
end

keywords_harry_potter = ["Lumos", "Magic", "Muggle", "Harry"]
keywords_harry_potter.each do |keyword_name|
  Keyword.create!(
    name: keyword_name,
    category: Category.find_by(name: "Harry Potter")
  )
end

keywords_art = ["Grafitti", "Paintings", "Blue", "Red", "Green", "Colours"]
keywords_art.each do |keyword_name|
  Keyword.create!(
    name: keyword_name,
    category: Category.find_by(name: "Art")
  )
end

keywords_food = ["Extra Cheese", "Pizza", "Plates", "Favourite Mug", "Fruits", "Pasta", "Bread"]
keywords_food.each do |keyword_name|
  Keyword.create!(
    name: keyword_name,
    category: Category.find_by(name: "Food")
  )
end

keywords_human_connection = ["People", "Laughter", "Friendship", "Love", "Hugs"]
keywords_human_connection.each do |keyword_name|
  Keyword.create!(
    name: keyword_name,
    category: Category.find_by(name: "Human Connection")
  )
end

keywords_animals = ["Dogs", "Cats", "Chicken", "Birds"]
keywords_animals.each do |keyword_name|
  Keyword.create!(
    name: keyword_name,
    category: Category.find_by(name: "Animals")
  )
end

keywords_garden = ["Flowers", "Birds"]
keywords_garden.each do |keyword_name|
  Keyword.create!(
    name: keyword_name,
    category: Category.find_by(name: "Garden")
  )
end

keywords_country = ["Chickens", "Feathers", "Hay"]
keywords_country.each do |keyword_name|
  Keyword.create!(
    name: keyword_name,
    category: Category.find_by(name: "Country Life")
  )
end

keywords_spirituality = ["Religion", "God", "Horoscope", "Yoga", "Meditation", "Zen", "Tantra"]
keywords_spirituality.each do |keyword_name|
  Keyword.create!(
    name: keyword_name,
    category: Category.find_by(name: "Spirituality")
  )
end

keywords_universe = ["Space", "Ufo", "Galaxy", "Aliens", "Stars"]
keywords_universe.each do |keyword_name|
  Keyword.create!(
    name: keyword_name,
    category: Category.find_by(name: "Universe")
  )
end

keywords_fashion = ["Street Style", "Dandy", "Cocktail", "Berlin"]
keywords_fashion.each do |keyword_name|
  Keyword.create!(
    name: keyword_name,
    category: Category.find_by(name: "Fashion")
  )
end

keywords_travel = ["Mountains", "Roadtrip"]
keywords_travel.each do |keyword_name|
  Keyword.create!(
    name: keyword_name,
    category: Category.find_by(name: "Travel")
  )
end

keywords_adventure = ["Exploration", "Fun", "Adrenaline"]
keywords_adventure.each do |keyword_name|
  Keyword.create!(
    name: keyword_name,
    category: Category.find_by(name: "Adventure")
  )
end

keywords_harmony = ["Balance", "Unity", "Synchronicity"]
keywords_harmony.each do |keyword_name|
  Keyword.create!(
    name: keyword_name,
    category: Category.find_by(name: "Harmony")
  )
end

keywords_nostalgia = ["Childhood Memories", "First Love", "Fleamarket", "Treasures"]
keywords_nostalgia.each do |keyword_name|
  Keyword.create!(
    name: keyword_name,
    category: Category.find_by(name: "Nostalgia")
  )
end

keywords_euphoria = ["Joyful", "Blissful", "Heartwarming"]
keywords_euphoria.each do |keyword_name|
  Keyword.create!(
    name: keyword_name,
    category: Category.find_by(name: "Euphoria")
  )
end

keywords_reflection = ["Self-Discovery", "Solitude", "Mirror", "Inner Peace"]
keywords_reflection.each do |keyword_name|
  Keyword.create!(
    name: keyword_name,
    category: Category.find_by(name: "Reflection")
  )
end

keywords_paradox = ["Contradiction", "Opposites", "Perspectives"]
keywords_paradox.each do |keyword_name|
  Keyword.create!(
    name: keyword_name,
    category: Category.find_by(name: "Paradox")
  )
end

puts "Keywords created"


UserCategory.create(
  user: User.find_by(username: "Axel"),
  category: Category.find_by(name: "Country Life")
)


UserCategory.create(
  user: User.find_by(username: "Alex"),
  category: Category.find_by(name: "Nature")
)

UserCategory.create(
  user: User.find_by(username: "Alex"),
  category: Category.find_by(name: "Garden")
)

UserCategory.create(
  user: User.find_by(username: "Alex"),
  category: Category.find_by(name: "Harry Potter")
)

UserCategory.create(
  user: User.find_by(username: "Alex"),
  category: Category.find_by(name: "Food")
)

# User Categories for User Lilly
# 2.times do
#   UserCategory.create(
#     user: user,
#     category: Category.all.sample
#   )
# end

# # User Categories for User Rose
# 2.times do
#   UserCategory.create(
#     user: user2,
#     category: Category.all.sample
#   )
# end

# AXEL POSTS
axel1 = Challenge.create!(
  keyword: Keyword.find_by(name: "Chickens"),
  user: User.find_by(username: "Axel"),
  created_at: Date.today - 1.days,
  start_date: Date.today - 1.days
)

file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686758318/ddd2233b-823a-48f7-a4dc-a6779ba10185_wp0h7c.jpg")
picture1 = Post.create!(
  date: Date.today - 1.days,
  challenge: axel1
)
picture1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
picture1.save

axel2 = Challenge.create!(
  keyword: Keyword.find_by(name: "Chickens"),
  user: User.find_by(username: "Axel"),
  created_at: Date.today - 2.days,
  start_date: Date.today - 2.days
)

file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686758481/i_m_a_star_dg7tpz.jpg")
picture2 = Post.create!(
  date: Date.today - 2.days,
  challenge: axel2
)
picture2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
picture2.save

axel3 = Challenge.create!(
  keyword: Keyword.find_by(name: "Chickens"),
  user: User.find_by(username: "Axel"),
  created_at: Date.today - 3.days,
  start_date: Date.today - 3.days
)

file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686758498/happy_qpsfxf.jpg")
picture3 = Post.create!(
  date: Date.today - 3.days,
  challenge: axel3
)
picture3.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
picture3.save


axel4 = Challenge.create!(
  keyword: Keyword.find_by(name: "Chickens"),
  user: User.find_by(username: "Axel"),
  created_at: Date.today - 4.days,
  start_date: Date.today - 4.days
)

file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686758579/__Photo_ohqdaw.png")
picture4 = Post.create!(
  date: Date.today - 4.days,
  challenge: axel4
)
picture4.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
picture4.save


axel5 = Challenge.create!(
  keyword: Keyword.find_by(name: "Chickens"),
  user: User.find_by(username: "Axel"),
  created_at: Date.today - 5.days,
  start_date: Date.today - 5.days
)

file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686758635/pet_ducks_pet_meme_funny_duck_portrait_ducklings_funny_animals_print_cute_animal_wallpapers_cute_pet_tcci61.jpg")
picture5 = Post.create!(
  date: Date.today - 5.days,
  challenge: axel5
)
picture5.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
picture5.save

axel6 = Challenge.create!(
  keyword: Keyword.find_by(name: "Chickens"),
  user: User.find_by(username: "Axel"),
  created_at: Date.today - 6.days,
  start_date: Date.today - 6.days
)

file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686758704/Chickens_in_Knitted_Caps_tbftjs.jpg")
picture6 = Post.create!(
  date: Date.today - 6.days,
  challenge: axel6
)
picture6.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
picture6.save

axel7 = Challenge.create!(
  keyword: Keyword.find_by(name: "Chickens"),
  user: User.find_by(username: "Axel"),
  created_at: Date.today - 7.days,
  start_date: Date.today - 7.days
)

file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686758773/__szpvso.jpg")
picture7 = Post.create!(
  date: Date.today - 7.days,
  challenge: axel7
)
picture7.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
picture7.save

axel8 = Challenge.create!(
  keyword: Keyword.find_by(name: "Chickens"),
  user: User.find_by(username: "Axel"),
  created_at: Date.today - 8.days,
  start_date: Date.today - 8.days
)

file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686758828/My_Pet_Chicken_s_Birthday_bugi9x.jpg")
picture8 = Post.create!(
  date: Date.today - 8.days,
  challenge: axel8
)
picture8.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
picture8.save


axel9 = Challenge.create!(
  keyword: Keyword.find_by(name: "Chickens"),
  user: User.find_by(username: "Axel"),
  created_at: Date.today - 9.days,
  start_date: Date.today - 9.days
)

file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686758891/A_hat_I_made_for_a_friend_q1cusp.jpg")
picture9 = Post.create!(
  date: Date.today - 9.days,
  challenge: axel9
)
picture9.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
picture9.save


axel10 = Challenge.create!(
  keyword: Keyword.find_by(name: "Chickens"),
  user: User.find_by(username: "Axel"),
  created_at: Date.today - 10.days,
  start_date: Date.today - 10.days
)

file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686758950/Selbstgemachtes_Gro%C3%9Fes_Huhn___Geflu%CC%88gel_Harness_fu%CC%88r_Laufen_auf_einer_Leine__NETT_f2o2lp.jpg")
picture10 = Post.create!(
  date: Date.today - 10.days,
  challenge: axel10
)
picture10.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
picture10.save


# ALEX POSTS

alex1 = Challenge.create!(
  keyword: Keyword.find_by(name: "Beach"),
  user: User.find_by(username: "Alex"),
  created_at: Date.today - 1.days,
  start_date: Date.today - 1.days
)

test = Post.create!(
date: Date.today - 1,
song_url: "https://open.spotify.com/track/3vUlwYTnFIHHHmUCDbvHkR?si=JbB3xYWLSyaUaKttWVp15Q",
challenge: alex1
)



puts "posts created"










# Create Seeds with personalized Challenges for Test User Lilly

# Post 1
# challenge1 = Challenge.create!(
#     keyword: Keyword.find_by(name: "Beach"),
#     user: User.find_by(email: "lilly@bloom.com"),
#     created_at: Date.today - 25.days,
#     start_date: Date.today - 25.days
#   )

# puts "challenge changed to yesterday"

# file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686230232/Hanna_Scho%CC%88nberg_dbdyak.jpg")
# picture1 = Post.create!(
#   date: Date.today - 25.days,
#   song_url: "",
#   poem: "",
#   text: "",
#   picture_url: "",
#   challenge: challenge1
# )
# picture1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# picture1.save

# puts "post 1 created"

# # Post 2

# challenge2 = Challenge.create!(
#   keyword: Keyword.find_by(name: "Green"),
#   user: User.find_by(email: "lilly@bloom.com"),
#   created_at: Date.today - 1.days,
#   start_date: Date.today - 1.days
# )

# file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686230288/Green_tiles_zgejii.jpg")
# picture2 = Post.create!(
#   date: Date.today - 1.days,
#   song_url: "",
#   poem: "",
#   text: "",
#   picture_url: "",
#   challenge: challenge2
# )
# picture2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# picture2.save

# # Post 3

# challenge3 = Challenge.create!(
#   keyword: Keyword.find_by(name: "People"),
#   user: User.find_by(email: "lilly@bloom.com"),
#   created_at: Date.today - 2.days,
#   start_date: Date.today - 2.days
# )

# file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686230336/__dpy8yi.png")
# picture3 = Post.create!(
#   date: Date.today - 2.days,
#   song_url: "",
#   poem: "",
#   text: "",
#   picture_url: "",
#   challenge: challenge3
# )
# picture3.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# picture3.save

# # Post 4

# challenge4 = Challenge.create!(
#   keyword: Keyword.find_by(name: "Paintings"),
#   user: User.find_by(email: "lilly@bloom.com"),
#   created_at: Date.today - 3.days,
#   start_date: Date.today - 3.days
# )

# file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686230372/Instagram_ngwy4a.jpg")
# picture4 = Post.create!(
#   date: Date.today - 3.days,
#   song_url: "",
#   poem: "",
#   text: "",
#   picture_url: "",
#   challenge: challenge4
# )
# picture4.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# picture4.save

# # Post 5

# challenge5 = Challenge.create!(
#   keyword: Keyword.find_by(name: "Friendship"),
#   user: User.find_by(email: "lilly@bloom.com"),
#   created_at: Date.today - 4.days,
#   start_date: Date.today - 4.days
# )

# file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686230434/_3_hi43vk.jpg")
# picture5 = Post.create!(
#   date: Date.today - 4.days,
#   song_url: "",
#   poem: "",
#   text: "",
#   picture_url: "",
#   challenge: challenge5
# )
# picture5.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# picture5.save

# # Post 6

# challenge6 = Challenge.create!(
#   keyword: Keyword.find_by(name: "Cats"),
#   user: User.find_by(email: "lilly@bloom.com"),
#   created_at: Date.today - 5.days,
#   start_date: Date.today - 5.days
# )

# file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686230471/__Kopie_2_wug2ll.jpg")
# picture6 = Post.create!(
#   date: Date.today - 5.days,
#   song_url: "",
#   poem: "",
#   text: "",
#   picture_url: "",
#   challenge: challenge6
# )
# picture6.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# picture6.save

# # Post 7

# challenge7 = Challenge.create!(
#   keyword: Keyword.find_by(name: "Friendship"),
#   user: User.find_by(email: "lilly@bloom.com"),
#   created_at: Date.today - 6.days,
#   start_date: Date.today - 6.days
# )

# file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686230512/adrianmntz_zfvjew.jpg")
# picture7 = Post.create!(
#   date: Date.today - 6.days,
#   song_url: "",
#   poem: "",
#   text: "",
#   picture_url: "",
#   challenge: challenge7
# )
# picture7.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# picture7.save

# # Post Song 1 deleted

# # Post 8

# challenge9 = Challenge.create!(
#   keyword: Keyword.find_by(name: "Extra Cheese"),
#   user: User.find_by(email: "lilly@bloom.com"),
#   created_at: Date.today - 8.days,
#   start_date: Date.today - 8.days
# )

# file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686231888/__voqctw.jpg")
# picture8 = Post.create!(
#   date: Date.today - 8.days,
#   song_url: "",
#   poem: "",
#   text: "",
#   picture_url: "",
#   challenge: challenge9
# )
# picture8.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# picture8.save


# # Post 9

# challenge10 = Challenge.create!(
#   keyword: Keyword.find_by(name: "Beach"),
#   user: User.find_by(email: "lilly@bloom.com"),
#   created_at: Date.today - 9.days,
#   start_date: Date.today - 9.days
# )

# file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686230569/%EF%B8%8F_mrllgf.jpg")
# picture9 = Post.create!(
#   date: Date.today - 9.days,
#   song_url: "",
#   poem: "",
#   text: "",
#   picture_url: "",
#   challenge: challenge10
# )
# picture9.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# picture9.save

# # Post 10

# challenge11 = Challenge.create!(
#   keyword: Keyword.find_by(name: "Dogs"),
#   user: User.find_by(email: "lilly@bloom.com"),
#   created_at: Date.today - 10.days,
#   start_date: Date.today - 10.days
# )

# file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686230615/zfdjstq3wucwupqnj2qh.jpg")
# picture10 = Post.create!(
#   date: Date.today - 10.days,
#   song_url: "",
#   poem: "",
#   text: "",
#   picture_url: "",
#   challenge: challenge11
# )
# picture10.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# picture10.save

# # Post 11

# challenge12 = Challenge.create!(
#   keyword: Keyword.find_by(name: "Flowers"),
#   user: User.find_by(email: "lilly@bloom.com"),
#   created_at: Date.today - 11.days,
#   start_date: Date.today - 11.days
# )

# file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686230665/Paper_Collective_Three_Flowers_30x40_-_Affischer_Fra%CC%8An_Magasin_a1vzhp.jpg")
# picture11 = Post.create!(
#   date: Date.today - 11.days,
#   song_url: "",
#   poem: "",
#   text: "",
#   picture_url: "",
#   challenge: challenge12
# )
# picture11.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# picture11.save

# # Post Song 2 deleted

# # challenge13 = Challenge.create!(
# #   keyword: Keyword.find_by(name: "Laughter"),
# #   user: User.find_by(email: "lilly@bloom.com"),
# #   created_at: Date.today - 12.days,
# #   start_date: Date.today - 12.days
# # )

# # song2 = Post.create!(
# #   date: Date.today,
# #   song_url: "https://open.spotify.com/embed/track/6INLpBxo9F5QMer04VXEnd?",
# #   challenge: challenge13
# # )

# # Post 12

# challenge14 = Challenge.create!(
#   keyword: Keyword.find_by(name: "Fruits"),
#   user: User.find_by(email: "lilly@bloom.com"),
#   created_at: Date.today - 13.days,
#   start_date: Date.today - 13.days
# )

# file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686230981/hehezee_fnjyrf.png")
# picture12 = Post.create!(
#   date: Date.today - 13.days,
#   song_url: "",
#   poem: "",
#   text: "",
#   picture_url: "",
#   challenge: challenge14
# )
# picture12.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# picture12.save

# # Post 13

# challenge15 = Challenge.create!(
#   keyword: Keyword.find_by(name: "Sun"),
#   user: User.find_by(email: "lilly@bloom.com"),
#   created_at: Date.today - 14.days,
#   start_date: Date.today - 14.days
# )

# file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686230759/jasminehendery_qqtasy.jpg")
# picture13 = Post.create!(
#   date: Date.today - 14.days,
#   song_url: "",
#   poem: "",
#   text: "",
#   picture_url: "",
#   challenge: challenge15
# )
# picture13.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# picture13.save

# # Post 14

# challenge16 = Challenge.create!(
#   keyword: Keyword.find_by(name: "Bread"),
#   user: User.find_by(email: "lilly@bloom.com"),
#   created_at: Date.today - 15.days,
#   start_date: Date.today - 15.days
# )

# file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686230868/b2pjgsrr8rlyw7veu6pz.jpg")
# picture14 = Post.create!(
#   date: Date.today - 15.days,
#   song_url: "",
#   poem: "",
#   text: "",
#   picture_url: "",
#   challenge: challenge16
# )
# picture14.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# picture14.save

# # Post 15

# challenge16 = Challenge.create!(
#   keyword: Keyword.find_by(name: "Muggle"),
#   user: User.find_by(email: "lilly@bloom.com"),
#   created_at: Date.today - 16.days,
#   start_date: Date.today - 16.days
# )

# file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686230926/Monday_Reading_at_The_Non_Sequitur_pafvi4.jpg")
# picture15 = Post.create!(
#   date: Date.today - 16.days,
#   song_url: "",
#   poem: "",
#   text: "",
#   picture_url: "",
#   challenge: challenge16
# )
# picture15.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# picture15.save

# # Post 16

# challenge17 = Challenge.create!(
#   keyword: Keyword.find_by(name: "Colours"),
#   user: User.find_by(email: "lilly@bloom.com"),
#   created_at: Date.today - 17.days,
#   start_date: Date.today - 17.days
# )

# file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686231210/Patterns_Everywhere_ijoj99.jpg")
# picture16 = Post.create!(
#   date: Date.today - 17.days,
#   song_url: "",
#   poem: "",
#   text: "",
#   picture_url: "",
#   challenge: challenge17
# )
# picture16.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# picture16.save

# # Post 17 photo not loading properly

# # challenge18 = Challenge.create!(
# #   keyword: Keyword.find_by(name: "Blue"),
# #   user: User.find_by(email: "lilly@bloom.com"),
# #   created_at: Date.today - 18.days,
# #   start_date: Date.today - 18.days
# # )

# # file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686231260/IMG_0730_gnhqfn.heic")
# # picture17 = Post.create!(
# #   date: Date.today,
# #   song_url: "",
# #   poem: "",
# #   text: "",
# #   picture_url: "",
# #   challenge: challenge18
# # )
# # picture17.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# # picture17.save

# # Post Text 1

# challenge19 = Challenge.create!(
#   keyword: Keyword.find_by(name: "Flowers"),
#   user: User.find_by(email: "lilly@bloom.com"),
#   created_at: Date.today - 19.days,
#   start_date: Date.today - 19.days
# )

# text = Post.create!(
#   date: Date.today - 19.days,
#   song_url: "",
#   poem: "",
#   text: "Trust the Process",
#   picture_url: "",
#   challenge: challenge19
# )

# # Post 18

# challenge20 = Challenge.create!(
#   keyword: Keyword.find_by(name: "Dogs"),
#   user: User.find_by(email: "lilly@bloom.com"),
#   created_at: Date.today - 20.days,
#   start_date: Date.today - 20.days
# )

# file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686231436/__2_fnlogw.jpg")
# picture18 = Post.create!(
#   date: Date.today - 20.days,
#   song_url: "",
#   poem: "",
#   text: "",
#   picture_url: "",
#   challenge: challenge20
# )
# picture18.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# picture18.save

# # Create Seeds with personalized Challenges and Posts for Test User Rose
# challenge21 = Challenge.create!(
#   keyword: Keyword.find_by(name: "Sun"),
#   user: User.find_by(email: "rose@bloom.com"),
#   created_at: Date.today - 21.days,
#   start_date: Date.today - 21.days
# )

# file = URI.open("https://res.cloudinary.com/da5l8jaar/image/upload/v1686575190/8d7fda0939878e93edcfd824f54d71e8_wbbiwp.jpg")
# picture19 = Post.create!(
#   date: Date.today - 21.days,
#   song_url: "",
#   poem: "",
#   text: "",
#   picture_url: "",
#   challenge: challenge21
# )
# picture19.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# picture19.save

# # Text post for Rose
# challenge22 = Challenge.create!(
#   keyword: Keyword.find_by(name: "Flowers"),
#   user: User.find_by(email: "rose@bloom.com"),
#   created_at: Date.today - 22.days,
#   start_date: Date.today - 22.days
# )

# text2 = Post.create!(
#   date: Date.today - 22.days,
#   song_url: "",
#   poem: "",
#   text: "Nature is the purest portal to inner peace",
#   picture_url: "",
#   challenge: challenge22
# )
















# puts 'Cleaning database'

# User.destroy_all

# -> Code from Alex
# User.destroy_all

# test_user = User.create!(
#   email: "test@mail.de",
#   password: "123456"
# )

# Category.create!(name: "Nature")
# Category.create!(name: "Art")
# Category.create!(name: "Animals")


# Keyword.create!(
#   name: "Flower",
#   category: Category.find_by(name: "Nature")
# )

# Keyword.create!(
#   name: "Sky",
#   category: Category.find_by(name: "Nature")
# )

# Keyword.create!(
#   name: "Blue",
#   category: Category.find_by(name: "Art")
# )

# Keyword.create!(
#   name: "Paintings",
#   category: Category.find_by(name: "Art")
# )

# Keyword.create!(
#   name: "Dogs",
#   category: Category.find_by(name: "Animals")
# )

# Keyword.create!(
#   name: "Cats",
#   category: Category.find_by(name: "Animals")
# )


# -> Code from Toni

# # Seed Users
# user = User.create(
#   email: "john@example.com",
#   password: "password"
# )

# # Seed Categories
# categories = ["Category 1", "Category 2", "Category 3"]
# categories.each do |category_name|
#   category = Category.create(name: category_name)
#   puts "Category created: #{category.name}"
# end

# # Seed Keywords
# keyword = Keyword.create(
#   name: "Your Keyword Name",
#   category_id: Category.first.id  # Replace with the appropriate category_id
# )

# # Seed Challenges
# challenge = Challenge.create(
#   keyword_id: keyword.id,
#   user_id: user.id,
#   start_date: Date.today
# )

# # Seed Posts
# post = Post.create(
#   date: Date.today,
#   song_url: "https://spotify.com/your-song-url",
#   poem: "Your poem content",
#   text: "Your text content",
#   picture_url: "https://example.com/your-picture-url",
#   medium: "photo",
#   challenge_id: challenge.id
# )

# # Seed User Categories
# UserCategory.create(
#   user_id: user.id,
#   category_id: Category.first.id  # Replace with the appropriate category_id
# )

# puts 'keywords added'

# # faking users with faker gem
# 10.times do
#   User.create!(
#     # first_name: Faker::Name.first_name,
#     # last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     # location: Faker::Address.city,
#     avatar_url: Faker::Avatar.image,
#     password: "123456"
#   )
# end

# puts "users created"

# Toni = User.create(
#   email: "toni@mail.de",
#   avatar_url: Faker::Avatar.image,
#   password: "123456"
# )

# puts 'toni created'

# A = User.create(
#   email: "a@a.a",
#   avatar_url: Faker::Avatar.image,
#   password: "aaaaaa"
# )

# puts 'a created as well'


# # Assuming you have Keyword and User models defined

# # Create some sample challenges
# 10.times do
#   Challenge.create!(
#     keyword_id: Keyword.pluck(:id).sample,
#     user_id: User.pluck(:id).sample,
#     start_date: Faker::Date.forward(days: 30)
#   )
# end

# puts 'now we have Challenge'



# 30.times do
#   Post.create!(
#     date: Faker::Date.backward(days: 30),
#     # lines below add 1 randome cotent
#     # song_url: rand(0..1) == 0 ? Faker::Internet.url : nil,
#     # poem: rand(0..1) == 0 ? Faker::Lorem.paragraph : nil,
#     # text: rand(0..1) == 0 ? Faker::Lorem.sentence : nil, add to next line rand(0..1) == 0 ? and : nil, after image
#     picture_url: Faker::LoremFlickr.image,
#     medium: Faker::Lorem.word,
#     #gets randome ids from the previous created challenge id
#     challenge_id: Challenge.pluck(:id).sample
#   )
# end

puts 'post posted hehe '

sleep 2

puts 'omg enjoy the seeds'

sleep 1

puts '✧ ♡ ( ◕ ‿ ◕ ✿ )'
