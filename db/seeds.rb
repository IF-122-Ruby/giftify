# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Generate 20 users
# 20.times do |id|
#   user = User.create!(
#     id: id,
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
#     avatar: Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg"),
#     email: Faker::Internet.email,
#     password: 'password'
#   )
#   org = Organization.create!(
#     id: id,
#     name: Faker::Company.industry,
#     creator_id: rand(1..20),
#     monthly_point: 100,
#     logo: Faker::Avatar.image 
#   )
#   Role.create!(user_id: user.id, organization_id: org.id, role: 'admin')
# end
