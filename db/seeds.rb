# frozen_string_literal: true

User.create!(name: "Admin",
             password: "password",
             password_confirmation: "password",
             admin: true)

40.times do |n|
  name  = Faker::Name.name
  password = 'password'
  User.create!(name: name,
               password: password,
               password_confirmation: password
              )
end
