class AddStudeniidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :studentid, :integer
  end
end
