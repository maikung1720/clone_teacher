class AddTelephoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :telephon, :string
  end
end
