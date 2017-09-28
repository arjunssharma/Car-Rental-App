class DropCars < ActiveRecord::Migration[5.1]
  def up
    drop_table :cars,  force: :cascade
    drop_table :bookings,  force: :cascade
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
