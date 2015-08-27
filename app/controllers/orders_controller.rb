class OrdersController < ApplicationController
	before_filter :authenticate_user!
	
	def index
		@order = Order.new(delivered: "OTW")
		@orders = Order.select(:delivered).distinct
		@address = []
		@address << Order.pluck(:pick_up_address_1)*","
		@address << Order.pluck(:pick_up_address_2)*","
		@address << Order.pluck(:pick_up_address_3)*","
		@address << Order.pluck(:pick_up_address_4)*","
		@address << Order.pluck(:drop_point_address_1)*","
		@address << Order.pluck(:drop_point_address_2)*","
		@address << Order.pluck(:drop_point_address_3)*","
		@address << Order.pluck(:drop_point_address_4)*","
		@shipper_address = []
		@shipper_address << Order.pluck(:shipper_address)*","
		@driver_info = []
		a = Order.all
		a.each do |x|
			c = {}
			c[:value] = x.no
			c[:name] = x.name
			c[:desc] = x.remarks
			c[:other] = x.driver_remarks
			@driver_info << c
		end
	end

	def dashboard
		@order = Order.all
		respond_to do |format|
			format.html
			format.csv { send_data @order.to_csv }
    format.xls # { send_data @products.to_csv(col_sep: "\t") }
  end
end


def create
	
	a = current_user.email
	@order = Order.create(order_params)
	@order.update(user_email: a)
	@records = Record.create(order_id: @order.id, changer: @order.user_email.split("@")[0], rate_history: @order.payment_with_gst)
  file = Tempfile.new(["a", ".csv"]) #do |csv|

     # csv << ["Application"]
     #  csv << "\n"
     #  csv << [@order.inquiry_date]
 
    	UserMailer.create_edit_order(@order, file).deliver

    # end


	redirect_to root_path(@order)
end


def edit
	@address = []
	@address << Order.pluck(:pick_up_address_1)*","
	@address << Order.pluck(:pick_up_address_2)*","
	@address << Order.pluck(:pick_up_address_3)*","
	@address << Order.pluck(:pick_up_address_4)*","
	@address << Order.pluck(:drop_point_address_1)*","
	@address << Order.pluck(:drop_point_address_2)*","
	@address << Order.pluck(:drop_point_address_3)*","
	@address << Order.pluck(:drop_point_address_4)*","
	@order = Order.find(params[:id])
end

def show
	@order = Order.find(params[:id])
end

def update
	@order = Order.find(params[:id])
	a = current_user.email
	@order.update(order_params)
	@order.update(user_email: a)
	if current_user.email != "mu@ikargo.com"
UserMailer.edit_order(@order).deliver
end
if @order.payment_with_gst != Record.last.rate_history
	@records = Record.create(order_id: @order.id, changer: @order.user_email.split("@")[0], rate_history: @order.payment_with_gst)
end
redirect_to root_path(@order)
      # Handle a successful update.
    end


    def destroy
    	@order = Order.find(params[:id])
    	if !@order.records.nil?
    		@order.records.destroy
    	end
    	@order.destroy
    # flash[:success] = "User deleted"
    redirect_to root_path
  end


  def export
  	@order = Order.order(:name)
  	respond_to do |format|
  		format.html
  		format.csv { send_data @order.to_csv }
    format.xls # { send_data @products.to_csv(col_sep: "\t") }
  end
end

private

def order_params

	params.require(:order).permit(:inquiry_date, :no, :shipper, :shipper_address, :transporter, :truck_size, :payment_rate,
		:payment_advance, :payment_paid, :payment_commision, :payment_balance, :remarks, :pick_up_address_1, :pick_up_pic_no_1, 
		:pick_up_address_2, :pick_up_pic_no_2, :pick_up_address_3, :pick_up_pic_no_3, :pick_up_address_4, :pick_up_pic_no_4,
		:drop_point_address_1, :drop_point_pic_no_1, :drop_point_address_2, :drop_point_pic_no_2, :drop_point_address_3, 
		:drop_point_pic_no_3, :drop_point_address_4, :drop_point_pic_no_4, :goods_description, :datetime, :special_request, 
		:drop_point_date, :trucks_capacity, :truck_reg_no, :name, :ic, :phone_no, :delivery_date, :do_request_date, :do_collection_date, 
		:do_number, :total_tonne, :payment_name, :tel_no, :account_no, :billing_name, :billing_amount, :billing_received, :billing_balance,
		:invoice_date, :invoice, :delivered, :payment_calculate_gst, :payment_reverse_calculate_gst, :gst_total_value, :payment_with_gst,
		:billing_with_gst, :billing_calculate_gst, :billing_reverse_calculate_gst, :gst_billing_total_value, :rate, :notes, :billing_rate, 
		:driver_remarks
		)
end
end















