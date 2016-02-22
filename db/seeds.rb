# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# languages = Language.create([{ name: 'English' }, { name: 'German' },
#  { name: 'Turk' }, { name: 'German' }, { name: 'German' }, { name: 'German' }])
50.times do |n|
  first_name  = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "example-#{n+1}@railstutorial.org"
  password = "12345678"
  location = "ankara"
  a = User.create!(first_name:  first_name,
  			   last_name: last_name,
  			   location: location,
               email: email,
               type: "Teacher",
               password:              password,
               password_confirmation: password)
  a.listings.create!(language_id: 1)
end
50.times do |n|
  first_name  = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "example-#{n+52}@railstutorial.org"
  password = "12345678"
  location = "istanbul"
  a = User.create!(first_name:  first_name,
  			   last_name: last_name,
  			   location: location,
               email: email,
               type: "Teacher",
               password:              password,
               password_confirmation: password)
  a.listings.create!(language_id: 1)
end