class CreateLabwares < ActiveRecord::Migration
  def change
    create_table :labwares do |t|
      t.string :name
      t.text :description
      t.integer :quantity, default: 0
      t.string :code

      t.timestamps null: false
    end
  end
end
