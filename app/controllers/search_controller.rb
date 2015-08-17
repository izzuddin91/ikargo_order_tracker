class SearchController < ApplicationController

	def index
		
  #store all the projects that match the name searched
  @shipper =  Order.search_by_name :shipper, params[:shipper]
  
end


def tracker
	@tracker_no = Order.search_by_name :no, params[:tracker_no]
end


def transporter
	@transporter = Order.search_by_name :transporter, params[:transporter]

end

def pick_up_date
	@pick_up_date = Order.search_by_name :datetime, params[:datetime]
end

def search_number
	@number = Order.where(['
		pick_up_pic_no_1 LIKE ? 
		OR
		pick_up_pic_no_2 LIKE ? 
		OR
		pick_up_pic_no_3 LIKE ? 
		OR
		pick_up_pic_no_4 LIKE ? 
		OR
		drop_point_pic_no_1 LIKE ? 
		OR
		drop_point_pic_no_2 LIKE ? 
		OR
		drop_point_pic_no_3 LIKE ? 
		OR
		drop_point_pic_no_4 LIKE ? 
		OR
		phone_no LIKE ?
		OR
		tel_no LIKE ?
		OR
		account_no LIKE ?
		OR 
		payment_name LIKE ?
		OR
		billing_name LIKE?',
		"%#{params[:numbers]}%",
		"%#{params[:numbers]}%",
		"%#{params[:numbers]}%", 
		"%#{params[:numbers]}%",
		"%#{params[:numbers]}%",
		"%#{params[:numbers]}%",
		"%#{params[:numbers]}%",
		"%#{params[:numbers]}%",
		"%#{params[:numbers]}%",
		"%#{params[:numbers]}%",
		"%#{params[:numbers]}%",
		"%#{params[:numbers]}%",
		"%#{params[:numbers]}%"
		])
end

end
