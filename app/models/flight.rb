class Flight < ApplicationRecord
  default_scope { order(:departure_date) }

  has_many :bookings
  has_many :passengers, through: :bookings

  belongs_to :arrival_airport, class_name: 'Airport', foreign_key: 'arrival_airport_id'
  belongs_to :departure_airport, class_name: 'Airport', foreign_key: 'departure_airport_id'

  validates :flight_number, presence: true
  validates :price, presence: true
  validates :arrival_date, presence: true
  validates :departure_date, presence: true

  def departure_date_formatted
    departure_date.strftime("%D")
  end

  def departure_year_date
    departure_date.yday
  end
end
