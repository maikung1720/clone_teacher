class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.datetime :rental_date
      t.datetime :due_date
      t.references :User, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end