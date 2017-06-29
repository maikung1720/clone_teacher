class AddImageToLabware < ActiveRecord::Migration
  def change
    add_column :labwares, :image, :text
  end
end
