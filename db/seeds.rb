# frozen_string_literal: true

User.create!(name: "Admin",
             password: "125634",
             password_confirmation: "125634",
             admin: true)

40.times do |n|
  name  = Faker::Name.name
  password = 'password'
  User.create!(name: name,
               password: password,
               password_confirmation: password
              )
end
