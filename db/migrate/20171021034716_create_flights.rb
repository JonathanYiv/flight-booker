class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.integer :departure_airport_id
      t.integer :arrival_airport_id
      t.integer :flight_number
      t.float :price
      t.datetime :arrival_date
      t.datetime :departure_date

      t.timestamps
    end
    add_index :flights, [:departure_airport_id, :arrival_airport_id]
  end
end
