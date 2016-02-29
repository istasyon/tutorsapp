# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# languages = Language.create([{ name: 'English' }, { name: 'German' },
#  { name: 'Turk' }, { name: 'German' }, { name: 'German' }, { name: 'German' }])
Language.create!(name: "English")
50.times do |n|
  first_name  = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "example-#{n+1}@railstutorial.org"
  password = "12345678"
  location = "Ankara"
  platform = ["inperson", "online", "both"]
  a = User.create!(first_name:  first_name,
           last_name: last_name,
           location: location,
               email: email,
               type: "Teacher",
               password:              password,
               password_confirmation: password)
  a.listings.create!(language_id: 1, 
                    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
                    Amet aspernatur illum debitis eaque harum maxime minus incidunt commodi 
                    ab consectetur enim veniam officiis nulla pariatur, quas itaque et quo cupiditate!",
                    price: 10+rand(40),
                    is_trial: rand(2),
                    platform: platform[rand(3)])
end
50.times do |n|
  first_name  = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "example-#{n+52}@railstutorial.org"
  password = "12345678"
  location = "Istanbul"
  platform = ["inperson", "online", "both"]
  a = User.create!(first_name:  first_name,
  			   last_name: last_name,
  			   location: location,
               email: email,
               type: "Teacher",
               password:              password,
               password_confirmation: password)
  a.listings.create!(language_id: 1, 
                    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
                    Amet aspernatur illum debitis eaque harum maxime minus incidunt commodi 
                    ab consectetur enim veniam officiis nulla pariatur, quas itaque et quo cupiditate!",
                    price: 10+rand(40),
                    is_trial: rand(2),
                    platform: platform[rand(3)])

end
