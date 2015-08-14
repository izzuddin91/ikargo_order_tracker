class PaymentInfo < ActiveRecord::Base
		belongs_to :order
end
