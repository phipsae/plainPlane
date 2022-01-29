# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

## User seeds
10.times do
  user = User.new(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, user_name: Faker::Internet.username, password: '123456', password_confirmation: '123456')
  user.save

  puts user.id
end

## Plane Models seeds
10.times do
  hp = rand(1000..10000)
  seats = rand(10..100)
  plane_model = PlaneModel.new(seats: seats, horsepower: hp, name: Faker::FunnyName.two_word_name)
  plane_model.save

  puts plane_model.id
end

## Plane seeds
10.times do
  price_cents = rand(1000000..1000000000)
  id = rand(1..20)
  model_id = rand(1..10)
  model = PlaneModel.find(model_id)
  user = User.find(id)
  plane = Plane.new(price: price_cents, name: Faker::Hipster.sentence(word_count: 6), availability: true)
  plane.user = user
  plane.plane_model = model
  plane.save

  puts plane.id
end

## Bookings seeds
10.times do |f|
  status = rand(2..4)
  user_id = rand(1..20)
  plane_id = rand(1..10)
  start = ['2021-01-01', '2021-02-01', '2021-03-01', '2021-04-01', '2021-05-01', '2022-01-01', '2022-02-01', '2022-03-01', '2022-04-01', '2022-05-01']
  end_date = ['2021-02-01', '2021-03-01', '2021-04-01', '2021-05-01', '2022-01-01', '2022-02-01', '2022-03-01', '2022-04-01', '2022-05-01', '2022-06-01']
  plane = Plane.find(plane_id)
  user = User.find(user_id)
  booking = Booking.new(status: status, start_date: start[f], end_date: end_date[f])
  booking.user = user
  booking.plane = plane
  booking.save

  puts booking.id
end
