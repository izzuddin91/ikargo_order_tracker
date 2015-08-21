class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :user_email
    	t.date :inquiry_date
    	t.string :no
    	t.string :shipper
      t.text :shipper_address
      t.string :transporter
      t.string :truck_size
    	t.string :details
    	t.text :remarks
      #notes on that particular shipment
      t.string :notes
      ##pick up

      t.date :datetime
      t.string :goods_description
      t.text :pick_up_address_1
      t.string :pick_up_pic_no_1
      t.text :pick_up_address_2
      t.string :pick_up_pic_no_2
      t.text :pick_up_address_3
      t.string :pick_up_pic_no_3
      t.text :pick_up_address_4
      t.string :pick_up_pic_no_4
      
      ##drop point
      t.date :drop_point_date
      t.text :drop_point_address_1
      t.string :drop_point_pic_no_1
       t.text :drop_point_address_2
      t.string :drop_point_pic_no_2
       t.text :drop_point_address_3
      t.string :drop_point_pic_no_3
       t.text :drop_point_address_4
      t.string :drop_point_pic_no_4
      #any request regarding drop point 
      t.string :special_request

      ##driver

      t.string :trucks_capacity
      t.string :truck_reg_no
      t.string :name
      t.string :ic
      t.string :phone_no
      t.string :driver_remarks

      ##delivery flow

      t.date :delivery_date
      t.date :do_request_date
      t.date :do_collection_date
      t.integer :do_number
      t.string :total_tonne

      ##payment info

      t.string :payment_name
      t.string :tel_no
      t.string :account_no
      t.decimal :payment_rate , precision: 8, scale: 2, default: 0
      t.decimal :payment_with_gst, precision: 8, scale: 2, default: 0
      t.decimal :payment_advance , precision: 8, scale: 2, default: 0
      t.decimal :payment_paid , precision: 8, scale: 2, default: 0
      t.decimal :payment_commision, precision: 8, scale: 2, default: 0
      t.decimal :payment_balance , precision: 8, scale: 2, default: 0
      t.string :rate
      ##billing_info

      t.string :billing_name
      #rate for billing
      t.string :billing_rate
      t.decimal :billing_amount, precision: 8, scale: 2, default: 0
      t.decimal :billing_received, precision: 8, scale: 2, default: 0
      t.decimal :billing_balance, precision: 8, scale: 2, default: 0
      t.date :invoice_date
      t.string :invoice
      ##gst

      t.boolean :payment_calculate_gst, :default => false
      t.boolean :payment_reverse_calculate_gst, :default => false
      t.boolean :billing_calculate_gst, :default => false
      t.boolean :billing_reverse_calculate_gst, :default => false
      t.string :gst_total_value
      #utk 6% gst
      t.string :gst_billing_total_value
      #master total utk billing
      t.string :billing_with_gst

      ##delivery status
      t.string :delivered
      t.timestamps null: false


    end
  end
end
