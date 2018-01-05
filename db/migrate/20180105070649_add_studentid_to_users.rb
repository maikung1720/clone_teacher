class AddStudentidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :studeniid, :integer
  end
end
