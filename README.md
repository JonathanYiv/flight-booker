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

I will use some sort of payment system.

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
	Routes: none
	Attributes:
		name - string
		abbreviation - string

Flight
	Routes: none
	Attributes:
		departure_airport_id - airport:references
		arrival_airport_id - airport:references

		flight_number - integer
		price - float

		arrival_date - datetime
		departure_date -datetime

Booking
	Routes: 
		:new, :create
	Attributes
		passenger_id - passenger:references
		flight_id - flight:references

Passenger
	Routes: none
	Attributes:
		name - string
		email - string

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

### Possible Userflow

```
User goes to main page, which has a search form.
They input a number of passengers, a starting airport, an ending airport, a departure date, and an arrival date.
They press search.
The page renders a new search results section.
They see that there are no applicable flights.
They fill in new flight data in the search form and press search again.
This time three flights are listed.
They select the second one by clicking its radio button.
They press the "Select" button at the bottom of the screen.
They are taken to a choice screen where they are prompted to either "Continue as User or Guest."
They select "Continue as Guest."
They are taken to a Passenger Information page that asks for their information.
They fill out their information, and then add the next passenger's information.
They fill out their payment information.
Then they click "Submit."
They receive a confirmation page that informs them that they will receive an email with their tickets.
They check their email and see the relevant email.
```

## Post-Project Thoughts

1. Testing

	I did a little reading on the testing community of Rails. Apparently the two major gems are Minitest and RSpec.
	Minitest comes shipped with Rails, RSpec doesn't.
	The Odin Project's curriculum so far has heavily advocated for the usage of RSpec due to its focus on BDD and human-readable code.
	However, I'm finding myself leaning towards the usage of Minitest.
	In this [blog post by Brandon Hilkert](http://brandonhilkert.com/blog/7-reasons-why-im-sticking-with-minitest-and-fixtures-in-rails/), he mentions 7 reasons why he is sticking to minitest, and I agree with him.
	Going forward, I think I will use Minitest/(Fixtures of Factory Girl..still experimenting here) primarily due to the performance metrics I've read about.

2. Length of Completion

	This took me five days. That's much longer than I usually take! I attribute that to a few things. One was attending [All Things Open](https://allthingsopen.org) the past two days, which essentially took up the whole day each day. Then was a 'weekend' day that I took a break. So that means the project actually took about two days, which is still on the longer end for me. I tried using the [Materialize](http://materializecss.com) CSS Framework this time, and while I prefer the out-of-the-box look vastly to bootstrap, it still involved some initial learning (I understand CSS Table Styling -- I think it's called -- now!) and I found out the Rails forms and Materialize form styling just **do not play well together at all.** This was very unfortunate. I definitely plan to give Materialize another try, but first I will learn [Simple Form](https://github.com/plataformatec/simple_form) and then add the [Materialize-Form](https://github.com/jamesfwz/materialize-form) gem to my Rails app.

3. Modern Design

	However, I certainly feel closer to producing cleaner designs that are closer to being 'modern.'
	Obviously, there's a lot more to learn, but I've come a long way from plaintext.

4. Integration Tests/N+1/Complex Search/Nested Forms

	Due to the issues with Rails forms and materialize, I had trouble producing any working version of a nested form, so I gave up on that for now. I learned a lot about what **doesn't** work, but I still need to fail more to reach a point where it does work.
	Furthermore, I did not add any integration tests to the project. I did add the model validations tests, which is more tests than I was previously adding (none). So that's progress.
	Additionally, I feel like my code for conducting the searches and producing the records wasn't as clean or best practices as it could be. I will be experimenting with some variations to improve upon my skill.
	Lastly, there is most definitely N+1 querying issues. I may come back to that one day and fix it.
	I guess progress is always in small steps.
	At least I can acknowledge my gaps of skill and work on them onwards.