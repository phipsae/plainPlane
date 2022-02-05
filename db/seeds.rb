require "open-uri"

## User seeds

User.destroy_all
PlaneModel.destroy_all
5.times do
  user = User.new(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, user_name: Faker::Internet.username, password: '123456', password_confirmation: '123456')
  user.save

  puts "User: #{user.id}"
end

## Plane Models seeds
10.times do |f|
  plane_type = [
    "Airbus A20N",
    "Airbus A21N",
    "Airbus A306",
    "Hawker Beechcraft BE40",
    "Cessna C25A",
    "Cessna C525",
    "Gulfstream Aerospace GLF4",
    "Lear Jet LJ60",
    "Boeing B788",
    "Douglas DC87"
  ]
  hp = rand(1000..10_000)
  seats = rand(10..100)
  plane_model = PlaneModel.new(seats: seats, horsepower: hp, name: plane_type[f])
  plane_model.save

  puts "Plane_model: #{plane_model.id}"
end

## Plane seeds
10.times do |f|
  plane_name = [
    "Cozy Airplane to travel with",
    "Fastest plane on earth",
    "Rainbow Travel Plane",
    "Travel to the moon with my awesome plane",
    "Travel the world",
    "Awesome plane trip",
    "Cheap plane but still flies",
    "Grahams Private Jet",
    "Philips Love Jet",
    "Upside Down Plane"
  ]

  plane_photo = [
    "https://contentzone.eurocontrol.int/aircraftperformance/images/acft_images_large/A20N_lufthansa_guidohaesevoets.jpg",
    "https://contentzone.eurocontrol.int/aircraftperformance/images/acft_images_large/39621889171_6edc8fa6aa_o_17146438.jpg",
    "https://contentzone.eurocontrol.int/aircraftperformance/images/acft_images_large/A306_dhl_guido-haesevoets.jpg",
    "https://contentzone.eurocontrol.int/aircraftperformance/images/acft_images_large/0959487-A.jpg",
    "https://contentzone.eurocontrol.int/aircraftperformance/images/acft_images_large/c25a-oe-fcy-climb.jpg",
    "https://contentzone.eurocontrol.int/aircraftperformance/images/acft_images_large/CJ1-A.jpg",
    "https://contentzone.eurocontrol.int/aircraftperformance/images/acft_images_large/0991446-A.jpg",
    "https://contentzone.eurocontrol.int/aircraftperformance/images/acft_images_large/0997348-A.jpg",
    "https://contentzone.eurocontrol.int/aircraftperformance/images/acft_images_large/B788_klm_guidohaesevoets.jpg",
    "https://contentzone.eurocontrol.int/aircraftperformance/images/acft_images_large/0999176-A.jpg"
  ]
  price_cents = rand(1_000_000..1_000_000_000)
  id = rand(User.first.id..User.last.id)
  model_id = rand(PlaneModel.first.id..PlaneModel.last.id)
  model = PlaneModel.find(model_id)
  user = User.find(id)
  plane = Plane.new(price: price_cents, name: plane_name[f], availability: true)
  plane.user = user
  plane.plane_model = model

  plane.save

  file = URI.open(plane_photo[f])
  plane.photo.attach(io: file, filename: "#{plane.id}.jpg", content_type: 'image/jpg')
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
