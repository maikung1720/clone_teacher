class AddCirculationToLabware < ActiveRecord::Migration
  def change
    add_column :labwares, :circulation, :integer, default: 0
  end
end
