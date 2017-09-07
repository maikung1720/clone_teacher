class AddRackNoToRental < ActiveRecord::Migration
  def change
    add_column :rentals, :rack_no, :integer
  end
end
