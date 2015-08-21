class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :order_id
      t.string :changer
      t.decimal :rate_history, precision: 8, scale: 2, default: 0
      t.timestamps null: false
    end
  end
end





