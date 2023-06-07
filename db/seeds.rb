# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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

# Seed Users
user = User.create(
  email: "john@example.com",
  password: "password"
)

# Seed Categories
categories = ["Category 1", "Category 2", "Category 3"]
categories.each do |category_name|
  category = Category.create(name: category_name)
  puts "Category created: #{category.name}"
end

# Seed Keywords
keyword = Keyword.create(
  name: "Your Keyword Name",
  category_id: Category.first.id  # Replace with the appropriate category_id
)

# Seed Challenges
challenge = Challenge.create(
  keyword_id: keyword.id,
  user_id: user.id,
  start_date: Date.today
)

# Seed Posts
post = Post.create(
  date: Date.today,
  song_url: "https://spotify.com/your-song-url",
  poem: "Your poem content",
  text: "Your text content",
  picture_url: "https://example.com/your-picture-url",
  medium: "photo",
  challenge_id: challenge.id
)

# Seed User Categories
UserCategory.create(
  user_id: user.id,
  category_id: Category.first.id  # Replace with the appropriate category_id
)
