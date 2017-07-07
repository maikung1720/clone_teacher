class CreateRentalDetails < ActiveRecord::Migration
  def change
    create_table :rental_details do |t|
      t.integer :rental_id
      t.integer :labware_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
