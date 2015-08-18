class Order < ActiveRecord::Base
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
end


