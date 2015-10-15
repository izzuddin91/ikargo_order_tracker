class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :no
      t.string :pod
      t.string :loading_status
      t.date :pick_up
      t.date :drop
      t.date :closing_date
      t.string :remarks
      t.timestamps null: false
    end
  end
end
