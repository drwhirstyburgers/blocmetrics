require 'faker'

10.times do
  User.create(
    email: Faker::Internet.unique.email,
    username: Faker::Internet.unique.user_name,
    password: 'password',
    confirmed_at: Time.now
  )
end
users = User.all

30.times do
  RegisteredApplication.create(
    user: users.sample,
    app_name: Faker::App.name,
    registration: Faker::Internet.url
  )
end
applications = RegisteredApplication.all

150.times do
  Event.create(
    registered_application: applications.sample,
    event_name: Faker::Hacker.verb,
    created_at: Time.at(rand * Time.now.to_i)
  )
end
