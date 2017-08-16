class AddCardNoToUser < ActiveRecord::Migration
  def change
    add_column :users, :card_no, :string
  end
end
