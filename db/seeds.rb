# coding: utf-8

User.create!( name: "Sample User",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)
              
100.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end   



users = User.order(:created_at).take(3)
50.times do |n| 
  contentname = "タスク#{n + 1}"
  content = Faker::Lorem.sentence
  users.each { |user| user.tasks.create!(contentname: contentname, content: content) }
end