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

  plane_description = [
    "The Airbus A320neo family (neo for new engine option) is a development of the A320 family of narrow-body airliners produced by Airbus. The A320neo family is based on the previous A319, A320 and A321 (enhanced variant), which was renamed to A320ceo, for current engine option.",
    "The Airbus A320neo family (neo for new engine option) is a development of the A320 family of narrow-body airliners produced by Airbus. The A320neo family is based on the previous A319, A320 and A321 (enhanced variant), which was renamed to A320ceo, for current engine option.",
    "The Airbus A300 is a wide-body airliner developed and manufactured by Airbus. In September 1967, aircraft manufacturers in the United Kingdom, France, and West Germany signed a memorandum of understanding to develop a large airliner. West Germany and France reached an agreement on 29 May 1969 after the British withdrew from the project on 10 April 1969. European collaborative aerospace manufacturer Airbus Industrie was formally created on 18 December 1970 to develop and produce it. The prototype first flew on 28 October 1972.",
    "The Hawker 400 (also known as the Beechjet 400) is a light business jet. Initially designed and built by Mitsubishi, it has been further developed and updated by the Beech Aircraft Company, now part of Textron Aviation. It was produced over 30 years under the names such as Mitsubishi Diamond/Diamond II, Beechjet 400/400A, and Hawker 400XP; military version T-1 Jayhawk was also produced. In total, over 900 Hawker 400s have been delivered. Since 2017, a factory-engineered and supported upgrade to Hawker 400XPR is provided, reducing fuel consumption by 16-20%, and improving range by as much as 33%.",
    "The Cessna CitationJet/CJ/M2 series are light business jets built by Cessna and part of the Citation family. Launched in October 1989, the Model 525 first flight was on April 29, 1991, Federal Aviation Administration certification was awarded on October 16, 1992, and first delivery happened on March 30, 1993. Powered by two Williams FJ44s, it uses the Citation II's forward fuselage with a new carry-through section, wing, and T-tail.",
    "The Cessna CitationJet/CJ/M2 series are light business jets built by Cessna and part of the Citation family. Launched in October 1989, the Model 525 first flight was on April 29, 1991, Federal Aviation Administration certification was awarded on October 16, 1992, and first delivery happened on March 30, 1993. Powered by two Williams FJ44s, it uses the Citation II's forward fuselage with a new carry-through section, wing, and T-tail.",
    "The Gulfstream IV (or G-IV or GIV) and derivatives are a family of twinjet aircraft, mainly for private or business use. They were designed and built by Gulfstream Aerospace, a General Dynamics company based in Savannah, Georgia, United States, from 1985 until 2018. Aircraft power is provided by two Rolls-Royce RB.183 Tay turbofans.",
    "The Learjet 60 is a mid-size cabin, medium-range business jet aircraft manufactured by Bombardier Aerospace in Wichita, Kansas. Powered by two Pratt & Whitney Canada PW305A engines, it has a range (with 4 passengers and 2 crew) of 2,405 nautical miles (4,454 km) with NBAA 100 nmi (190 km) reserves, ISA. In July 2012 Bombardier Aerospace announced a temporary 'production pause' of the latest variant Learjet 60XR to begin in the fourth quarter of 2012.",
    "The Boeing 787 Dreamliner is an American wide-body jet airliner developed and manufactured by Boeing Commercial Airplanes. After dropping its Sonic Cruiser project, Boeing announced the conventional 7E7 on January 29, 2003, focused on efficiency. The program was launched on April 26, 2004, with an order for 50 from All Nippon Airways (ANA), targeting a 2008 introduction. On July 8, 2007, the prototype was rolled out without major systems, and experienced multiple delays until its maiden flight on December 15, 2009. Type certification was received in August 2011 and the first 787-8 was delivered in September 2011 before entering commercial service on October 26, 2011, with ANA.",
    "The Douglas DC-8 (sometimes McDonnell Douglas DC-8) is a long-range narrow-body airliner built by the American Douglas Aircraft Company. After losing the May 1954 US Air Force tanker competition to the Boeing KC-135, Douglas announced in July 1955 its derived jetliner project. In October 1955, Pan Am made the first order along with the competing Boeing 707, and many other airlines followed. The first DC-8 was rolled out in Long Beach Airport on 9 April 1958 and flew for the first time on 30 May. FAA certification was achieved in August 1959 and the DC-8 entered service with Delta Air Lines on September 18."
  ]

  price_cents = rand(1_000_000..1_000_000_000)
  id = rand(User.first.id..User.last.id)
  model_id = rand(PlaneModel.first.id..PlaneModel.last.id)
  model = PlaneModel.find(model_id)
  user = User.find(id)
  plane = Plane.new(price: price_cents, name: plane_name[f], availability: true, description: plane_description[f])
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
