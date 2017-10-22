# Creates 10 Airports with random Cities / Codes.

10.times do |n|
  name = Faker::Address.city
  abbreviation = Faker::Address.country_code_long
  Airport.create(name:         name,
                 abbreviation: abbreviation)
end

airports = Airport.all

10.times do |n|
  departure_airport = airports.sample
  arrival_airport = airports.sample
  until departure_airport != arrival_airport
    arrival_airport = airports.sample
  end
  flight_number = Faker::Number.number(3)
  price = Faker::Number.decimal(2)
  departure_date = Faker::Time.between(DateTime.now, 7.days.from_now)
  arrival_date = Faker::Time.between(departure_date, departure_date + 17.hours)
  Flight.create(departure_airport: departure_airport,
                arrival_airport:   arrival_airport,
                flight_number:     flight_number,
                price:             price,
                departure_date:    departure_date,
                arrival_date:      arrival_date)
end