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

doctors = [
  {
    name: "doctor3",
    age: 28,
    city_id: 2,
    user_id: 2,
    description: "asad121212wasg1",
    image_url: "saqwqwqasa",
    detail_attributes: {
      price: 12,
      specialization: "Surgery-1",
      studies: "University of life-2"
    }
  },
  {
    name: "doctor4",
    age: 45,
    city_id: 4,
    user_id: 1,
    description: "asad1",
    image_url: "saqwqwqasa",
    detail_attributes: {
      price: 120,
      specialization: "Surgery-1",
      studies: "University of life-2"
    }
  },
  {
    name: "doctor5",
    age: 66,
    city_id: 1,
    user_id: 4,
    description: "asad112wa21",
    image_url: "saqwqwqasa",
    detail_attributes: {
      price: 12320,
      specialization: "Surgery-1",
      studies: "University of life-2"
    }
  },
  {
    name: "doctor6",
    age: 23,
    city_id: 3,
    user_id: 3,
    description: "asad12asadaf121",
    image_url: "saqwqwqasa",
    detail_attributes: {
      price: 13454,
      specialization: "Surgery-1",
      studies: "University of life-2"
    }
  }
]

City.create(cities)

users.each do |user_params|
  User.create(user_params)
end

doctors.each do |doctor_params|
  Doctor.create(doctor_params)
end
