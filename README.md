# Flight Booker Project

The goal of this project is to implement some advanced forms in the form of a flight booker.

A typical flight booking flow might be:

1. The user enters the desired dates and airports, and clicks "Search."

2. The user picks from a list of eligible flights.

3. The user enters passenger information for all passengers.

4. The user enters their billing information.

This is a project from [The Odin Project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/building-advanced-forms).

Screenshot here...

## Pre-Project Thoughts

This is another iteration of practicing Rails.

This time I will use [Materialize](https://github.com/mkhairi/materialize-sass), another front-end framework.

I will add testing via RSpec/FactoryGirl/Faker.

I will add authentication with Devise.

I will seed the database with Faker.

### Pages

1. Search Page

	This page will have a form that allows you to search by arrival/departure airports, arrival/departure dates, and number of passengers.
	The date selection should only include datas with existing flights.
	Clicking the 'Search' button will redirect to this same page with the results listed.

2. Pick a Flight

	When a user clicks the 'Search' button, the 'Pick a Flight' portion of the Search page is rendered.
	If no applicable flights are found, it states "There are no flights that match those criteria."
	If there are applicable flights, all of the flights render with a radio button next to it.
	The user can select one of the flights and then submit it as their selection.

3. Passenger Information

	When a user submits their chosen flight, they must provide their booking information.
	This page will have a form to submit their booking and simultaneously create a passenger instance for each passenger.

### Models

```ruby
Airport
	Routes:
	Attributes:

Flight
	Routes:
	Attributes:

Booking
	Routes:
	Attributes

Passenger
	Routes:
	Attributes:
```

### Associations

```ruby
Airport
	has_many :arriving_flights, class_name: 'Flight', foreign_key: 'arrival_airport_id'
	has_many :departing_flights, class_name: 'Flight', foreign_key: 'departure_airport_id'

Flight
	has_many :bookings
	has_many :passengers, through: :bookings

	belongs_to :arrival_airport, class_name: 'Airport', foreign_key: 'arrival_airport_id'
	belongs_to :departure_airport, class_name: 'Airport', foreign_key: 'departure_airport_id'

Booking
	belongs_to :passenger
	belongs_to :flight

Passenger
	has_many :bookings
```

## Post-Project Thoughts

Incomplete...