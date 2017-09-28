class DropCars < ActiveRecord::Migration[5.1]
  def up
    drop_table :cars
    drop_table :bookings
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
