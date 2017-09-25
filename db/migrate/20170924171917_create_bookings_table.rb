class CreateBookingsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings_tables do |t|
      t.string :client
      t.string :phone
      t.string :place
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.date :starting
      t.date :ending
      t.references :car, index: true, foreign_key: true
      t.timestamps
    end
  end
end
