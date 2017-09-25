class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings, force: :cascade do |t|
      t.string :email_id
      t.string :phone
      t.string :place
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.datetime :start_time
      t.datetime :end_time
      t.references :car, index: true, foreign_key: true
      t.references :user, index:true, foreign_key: true
      t.timestamps
    end
  end
end
