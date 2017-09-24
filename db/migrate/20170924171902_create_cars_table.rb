class CreateCarsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :cars_tables do |t|
      t.string :name
      t.text :description
      t.string :comfort_class
      t.string :status
      t.float :price
      t.datetime :created_at,    null: false
      t.datetime :updated_at,    null: false
      t.string :picture
      t.timestamps
    end
  end
end
