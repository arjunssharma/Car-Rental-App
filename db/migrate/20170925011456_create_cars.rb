class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars, force: :cascade do |t|
      t.string :name
      t.text :description
      t.string :license_number
      t.string :manufacturer
      t.string :style
      t.float :price
      t.integer :status, default: 0
      t.string :location
      t.datetime :created_at,    null: false
      t.datetime :updated_at,    null: false
      t.timestamps
    end
  end
end
