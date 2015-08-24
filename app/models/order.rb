class Order < ActiveRecord::Base
	include ActiveModel::Dirty

	# attribute_will_change!

	# :tel_no, :account_no, :payment_rate, :payment_with_gst, :payment_advance ,:payment_paid, :payment_commision, :payment_balance, :rate, :billing_name, :billing_rate, :billing_amount, :billing_received, :billing_balance, :invoice_date, :invoice, :payment_calculate_gst, :payment_reverse_calculate_gst, :billing_calculate_gst, :billing_reverse_calculate_gst, :gst_total_value, :gst_billing_total_value, :billing_with_gst


# def name
#     @name
#   end

#   def name=(val)
#     name_will_change! unless val == @name
#     @name = val
#   end

#   def save
#     # do persistence work

#     changes_applied
#   end

#   def reload!
#     # get the values from the persistence layer

#     clear_changes_information
#   end

#   def rollback!
#     restore_attributes
#   end



	include PgSearch
	pg_search_scope :search_by_name, ( lambda do |name_part, query|
		raise ArgumentError unless [:shipper, :transporter, :datetime, :no, :pick_up_pic_no, :phone_no, :tel_no ].include?(name_part)
		{:against => name_part,
			:query => query
		}
	end)


	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |product|
				csv << product.attributes.values_at(*column_names)
			end
		end
	end
	belongs_to :user
	has_many :records
end


