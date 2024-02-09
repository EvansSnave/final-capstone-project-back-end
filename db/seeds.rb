# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
cities = [
  { name: 'New York' },
  { name: 'Texas' },
  { name: 'California' },
  { name: 'Ohio' },
]

users = [
  {
    name: "kevin12",
    email: "kevin12@email",
    password: "password",
    password_confirmation: "password"
  },
  {
    name: "kevin1",
    email: "kevin1@email",
    password: "password",
    password_confirmation: "password"
  },
  {
    name: "kevin2",
    email: "kevin2@email",
    password: "password",
    password_confirmation: "password"
  },
]

City.create(cities)

users.each do |user_params|
  User.create(user_params)
end
