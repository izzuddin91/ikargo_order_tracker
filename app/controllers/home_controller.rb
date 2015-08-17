class HomeController < ApplicationController

	def index
		if user_signed_in?
			redirect_to :controller => "orders", :action => "dashboard"
		end
		
	end
end
