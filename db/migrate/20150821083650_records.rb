class Records < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :changer
      t.decimal :rate_history, precision: 8, scale: 2, default: 0

    end
  end
end
