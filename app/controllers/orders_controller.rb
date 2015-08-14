class OrdersController < ApplicationController
	before_filter :authenticate_user!
	def index
		@order = Order.new
	end

	def dashboard
		@order = Order.all
	end

	def create
		@order = Order.create(
			inquiry_date: params[:order][:inquiry_date], 
			no: params[:order][:no], 
			shipper: params[:order][:shipper],
			shipper_address: params[:order][:shipper_address],
			transporter: params[:order][:transporter], 
			truck_size: params[:order][:truck_size],
			payment_rate: params[:order][:payment_rate], 
			payment_advance: params[:order][:payment_advance], 
			payment_paid: params[:order][:payment_paid], 
			payment_commision: params[:order][:payment_commision], 
			payment_balance: params[:order][:payment_balance], 
			remarks: params[:order][:remarks], 
			pick_up_address_1: params[:order][:pick_up_address_1],
			pick_up_pic_no_1: params[:order][:pick_up_pic_no_1],
			pick_up_address_2: params[:order][:pick_up_address_2],
			pick_up_pic_no_2: params[:order][:pick_up_pic_no_2],
			pick_up_address_3: params[:order][:pick_up_address_3],
			pick_up_pic_no_3: params[:order][:pick_up_pic_no_3],
			pick_up_address_4: params[:order][:pick_up_address_4],
			pick_up_pic_no_4: params[:order][:pick_up_pic_no_4],
			drop_point_address_1: params[:order][:drop_point_address_1],
			drop_point_pic_no_1: params[:order][:drop_point_pic_no_1],
			drop_point_address_2: params[:order][:drop_point_address_2],
			pick_up_pic_no_2: params[:order][:pick_up_pic_no_2],
			drop_point_address_3: params[:order][:drop_point_address_3],
			pick_up_pic_no_3: params[:order][:pick_up_pic_no_3],
			drop_point_address_4: params[:order][:drop_point_address_4],
			pick_up_pic_no_4: params[:order][:pick_up_pic_no_4],
			goods_description: params[:order][:goods_description],
			datetime: params[:order][:datetime],
			special_request: params[:order][:special_request],
			drop_point_date: params[:order][:drop_point_date],
			trucks_capacity: params[:order][:trucks_capacity],
			truck_reg_no: params[:order][:truck_reg_no],
			name: params[:order][:name],
			ic: params[:order][:ic],
			phone_no: params[:order][:phone_no],
			delivery_date: params[:order][:delivery_date],
			do_request_date: params[:order][:do_request_date],
			do_collection_date: params[:order][:do_collection_date],
			do_number: params[:order][:do_number],
			total_tonne: params[:order][:total_tonne],
			payment_name: params[:order][:payment_name],
			tel_no: params[:order][:tel_no],
			account_no: params[:order][:account_no],
			billing_name: params[:order][:billing_name],
			billing_amount: params[:order][:billing_amount],
			billing_received: params[:order][:billing_received],
			billing_balance: params[:order][:billing_balance],
			invoice_date: params[:order][:invoice_date],
			invoice: params[:order][:invoice],
			payment_collection: params[:order][:payment_collection],
			delivered: params[:delivered],
			payment_calculate_gst: params[:order][:payment_calculate_gst],
			payment_reverse_calculate_gst: params[:order][:payment_reverse_calculate_gst],
			gst_total_value: params[:order][:gst_total_value],
			payment_with_gst: params[:order][:payment_with_gst],
			billing_with_gst: params[:order][:billing_with_gst],
			billing_calculate_gst: params[:order][:billing_calculate_gst],
			billing_reverse_calculate_gst: params[:order][:billing_reverse_calculate_gst],
			gst_billing_total_value: params[:order][:gst_billing_total_value],
			rate: params[:order][:rate]
			)
redirect_to root_path(@order)
end

def edit
	@order = Order.find(params[:id])
end

def show
	@order = Order.find(params[:id])
end

def update
	
	@order = Order.find(params[:id])

	@order.update(
			inquiry_date: params[:order][:inquiry_date], 
			no: params[:order][:no], 
			shipper: params[:order][:shipper],
			shipper_address: params[:order][:shipper_address],
			transporter: params[:order][:transporter], 
			truck_size: params[:order][:truck_size],
			payment_rate: params[:order][:payment_rate], 
			payment_advance: params[:order][:payment_advance], 
			payment_paid: params[:order][:payment_paid], 
			payment_commision: params[:order][:payment_commision], 
			payment_balance: params[:order][:payment_balance], 
			remarks: params[:order][:remarks], 
			pick_up_address_1: params[:order][:pick_up_address_1],
			pick_up_pic_no_1: params[:order][:pick_up_pic_no_1],
			pick_up_address_2: params[:order][:pick_up_address_2],
			pick_up_pic_no_2: params[:order][:pick_up_pic_no_2],
			pick_up_address_3: params[:order][:pick_up_address_3],
			pick_up_pic_no_3: params[:order][:pick_up_pic_no_3],
			pick_up_address_4: params[:order][:pick_up_address_4],
			pick_up_pic_no_4: params[:order][:pick_up_pic_no_4],
			drop_point_address_1: params[:order][:drop_point_address_1],
			drop_point_pic_no_1: params[:order][:drop_point_pic_no_1],
			drop_point_address_2: params[:order][:drop_point_address_2],
			pick_up_pic_no_2: params[:order][:pick_up_pic_no_2],
			drop_point_address_3: params[:order][:drop_point_address_3],
			pick_up_pic_no_3: params[:order][:pick_up_pic_no_3],
			drop_point_address_4: params[:order][:drop_point_address_4],
			pick_up_pic_no_4: params[:order][:pick_up_pic_no_4],
			goods_description: params[:order][:goods_description],
			datetime: params[:order][:datetime],
			special_request: params[:order][:special_request],
			drop_point_date: params[:order][:drop_point_date],
			trucks_capacity: params[:order][:trucks_capacity],
			truck_reg_no: params[:order][:truck_reg_no],
			name: params[:order][:name],
			ic: params[:order][:ic],
			phone_no: params[:order][:phone_no],
			delivery_date: params[:order][:delivery_date],
			do_request_date: params[:order][:do_request_date],
			do_collection_date: params[:order][:do_collection_date],
			do_number: params[:order][:do_number],
			total_tonne: params[:order][:total_tonne],
			payment_name: params[:order][:payment_name],
			tel_no: params[:order][:tel_no],
			account_no: params[:order][:account_no],
			billing_name: params[:order][:billing_name],
			billing_amount: params[:order][:billing_amount],
			billing_received: params[:order][:billing_received],
			billing_balance: params[:order][:billing_balance],
			invoice_date: params[:order][:invoice_date],
			invoice: params[:order][:invoice],
			payment_collection: params[:order][:payment_collection],
			delivered: params[:delivered],
			payment_calculate_gst: params[:order][:payment_calculate_gst],
			payment_reverse_calculate_gst: params[:order][:payment_reverse_calculate_gst],
			gst_total_value: params[:order][:gst_total_value],
			payment_with_gst: params[:order][:payment_with_gst],
			billing_with_gst: params[:order][:billing_with_gst],
			billing_calculate_gst: params[:order][:billing_calculate_gst],
			billing_reverse_calculate_gst: params[:order][:billing_reverse_calculate_gst],
			gst_billing_total_value: params[:order][:gst_billing_total_value],
			rate: params[:order][:rate]
			)
      # Handle a successful update.
      redirect_to root_path(@order)
  end


  def destroy
  	
  	@order = Order.find(params[:id])
  	@order.destroy
    # flash[:success] = "User deleted"
    redirect_to root_path
end




private

def order_params
	params.require(:order).permit(
		:inquiry_date , 
		:no , 
		:shipper ,
		:transporter , 
		:truck_size ,
		:rate , 
		:remarks , 
		:address ,
		:goods_description ,
		:datetime ,
		:pick_up_pic_no ,
		:special_request ,
		:drop_point_date ,
		:drop_point_pic_no ,
		:trucks_capacity ,
		:truck_reg_no ,
		:name ,
		:ic ,
		:phone_no ,
		:delivery_date ,
		:do_request_date ,
		:do_collection_date ,
		:do_number ,
		:total_tonne ,
		:payment_name ,
		:tel_no ,
		:account_no ,
		:advance ,
		:paid ,
		:balance ,
		:billing_name ,
		:amount ,
		:invoice_date ,
		:invoice ,
		:payment_collection 
		)
end


end
