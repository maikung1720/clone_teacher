class AddClassRooomToUsers < ActiveRecord::Migration
  def change
    add_column :users, :class_rooom, :integer
  end
end
