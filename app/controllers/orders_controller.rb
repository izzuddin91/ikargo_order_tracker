class OrdersController < ApplicationController
	before_filter :authenticate_user!
	
	def index
		@order = Order.new
	end

  def autocomplete_address
@target = []
order = Order.all
order.each do |x|
  @target << x.pick_up_address_1 
  @target << x.pick_up_address_2 
  @target << x.pick_up_address_3  
  @target << x.pick_up_address_4  
  @target << x.drop_point_address_1  
  @target <<  x.drop_point_address_2 
  @target << x.drop_point_address_3 
  @target << x.drop_point_address_4 
  @target <<  x.shipper_address   
  @target.flatten.reject{|x| x == ""}.uniq!
  #reject any duplicates
  @target & @target
end

#
number = params[:address].length - 1
@back = []
@target.each do |x|
  if x[0..(number)].downcase == params[:address].downcase
    @back << x
  end
end
    render json: @back
  end

	def dashboard
		@order = Order.paginate(:page => params[:page], :per_page => 20).order('no ASC')
		respond_to do |format|
			format.html
			format.csv { send_data @order.to_csv }
    format.xls # { send_data @products.to_csv(col_sep: "\t") }
  end
end

def create
	# a = current_user.email
	@order = Order.create(order_params)
  # UserMailer.create_edit_order(@order, a).deliver
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
	a = current_user.email
	@order.update(order_params)
  UserMailer.edit_order(@order, a).deliver
  redirect_to root_path(@order)
      # Handle a successful update.
    end


    def destroy
    	@order = Order.find(params[:id])

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


def statistic
  @order = []
  a = params[:id]
  @today = params[:id]
  
  time = Time.parse(a)
  compare = time.strftime("%Y-%m-%d")
  Order.all.each do |x|
    if !x.datetime.nil? && (x.datetime.strftime("%Y-%m-%d") == compare)
      @order << x
    end
  end
   @order 
end


def show_details
  @callback = []
  response = Order.find_by(id: params[:response])
  @callback << response.inquiry_date
  @callback << response.no
  @callback << response.shipper
  @callback << response.shipper_address
  @callback << response.transporter
  @callback << response.truck_size
  @callback << response.details
  @callback << response.remarks
  @callback << response.notes
  @callback << response.datetime
  @callback << response.goods_description
  @callback << response.pick_up_address_1
  @callback << response.pick_up_pic_no_1
  @callback << response.pick_up_address_2
  @callback << response.pick_up_pic_no_2
  @callback << response.pick_up_address_3
  @callback << response.pick_up_pic_no_3
  @callback << response.pick_up_address_4
  @callback << response.pick_up_pic_no_4
  @callback << response.special_request
  @callback << response.drop_point_address_1
  @callback << response.drop_point_pic_no_1
  @callback << response.drop_point_address_2
  @callback << response.drop_point_pic_no_2
  @callback << response.drop_point_address_3
  @callback << response.drop_point_pic_no_3
  @callback << response.drop_point_address_4
  @callback << response.drop_point_pic_no_4
  @callback << response.trucks_capacity 
  @callback << response.truck_reg_no 
  @callback << response.name
  @callback << response.ic 
  @callback << response.phone_no
  @callback << response.delivery_date
  @callback << response.do_request_date
  @callback << response.do_collection_date
  @callback << response.do_number
  @callback << response.total_tonne
  @callback << response.payment_name
  @callback << response.tel_no
  @callback << response.account_no
  @callback << response.rate
  @callback << response.payment_rate
  @callback << response.gst_total_value
  @callback << response.payment_with_gst
  @callback << response.payment_advance
  @callback << response.payment_paid
  @callback << response.payment_commision
  @callback << response.payment_balance
  @callback << response.billing_name
  @callback << response.billing_rate
  @callback << response.billing_amount
  @callback << response.gst_billing_total_value
  @callback << response.billing_with_gst
  @callback << response.billing_received
  @callback << response.billing_balance
  @callback << response.invoice_date
  @callback << response.invoice
  render json: @callback
end

def calendar
  order = Order.all
  @orders_by_date = order.group_by(&:datetime)
  @date = params[:date] ? Date.parse(params[:date]) : Date.today
  
end

def payment_overdue
  @payment_overdue = []
  Order.all.each do |x|
    if !(x.created_at..x.created_at+604800).cover?(Time.now) && !(x.payment_balance == 0)
      @payment_overdue << x
    end
  end
end


private


def order_params
	params.require(:order).permit(:no, :pod, :loading_status, :pick_up, :drop, :closing_date, :remarks)
end
end















