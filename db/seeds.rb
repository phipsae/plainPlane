require "open-uri"

## User seeds


10.times do
  user = User.new(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, user_name: Faker::Internet.username, password: '123456', password_confirmation: '123456')
  user.save

  puts "User: #{user.id}"
end


## Plane Models seeds
20.times do
  hp = rand(1000..10000)
  seats = rand(10..100)
  plane_model = PlaneModel.new(seats: seats, horsepower: hp, name: Faker::FunnyName.two_word_name)
  plane_model.save

  puts "Plane_model: #{plane_model.id}"
end


## Plane seeds
20.times do |f|
  price_cents = rand(1000000..1000000000)
  id = rand(User.first.id..User.last.id)
  model_id = rand(PlaneModel.first.id..PlaneModel.last.id)
  model = PlaneModel.find(model_id)
  user = User.find(id)
  plane = Plane.new(price: price_cents, name: Faker::Hipster.sentence(word_count: 6), availability: true)
  plane.user = user
  plane.plane_model = model

  plane.save

  file = URI.open('https://source.unsplash.com/collection/1491223')
  # plane_picture = Plane.new(title: "#{plane.id}", body: "#{plane.id}")
  plane.photo.attach(io: file, filename: "#{plane.id}.png", content_type: 'image/png')

  # plane collection  https://source.unsplash.com/collection/1491223

  puts "Plane #{plane.id}"
end


## Bookings seeds
10.times do |f|
  status = rand(2..4)
  user_id = rand(User.first.id..User.last.id)
  plane_id = rand(Plane.first.id..Plane.last.id)
  start = ['2021-01-01', '2021-02-01', '2021-03-01', '2021-04-01', '2021-05-01', '2022-01-01', '2022-02-01', '2022-03-01', '2022-04-01', '2022-05-01']
  end_date = ['2021-02-01', '2021-03-01', '2021-04-01', '2021-05-01', '2022-01-01', '2022-02-01', '2022-03-01', '2022-04-01', '2022-05-01', '2022-06-01']
  plane = Plane.find(plane_id)
  user = User.find(user_id)
  booking = Booking.new(status: status, start_date: start[f], end_date: end_date[f])
  booking.user = user
  booking.plane = plane
  booking.save

  puts "Booking: #{booking.id}"
end
