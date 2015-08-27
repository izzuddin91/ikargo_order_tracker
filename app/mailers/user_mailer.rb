
class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.create_edit_order.subject
  #



  def create_edit_order(order, file)
   @order = order
   CSV.open(file, 'rb+', 
    :write_headers => true,
    :headers => [
      "Inquiry Date",
      "No", 
      "Shipper",
      "Details",
      "DateTime",
      "Trucks Size / Type" ,
      "Goods Description",
      "Address",
      " PIC Tel",
      "Special Request" ,
      "Trucks Capacity /Type" ,
      "Truck Reg. No." ,
      "Name / IC" ,
      "Tel",
      "Date / Time",
      "Address",
      "PIC Tel" ,
      "Special Request",
      "Delivery Status/Date" ,
      "D.O. Request/Date",
      "D.O. Collection/Date",
      "D.O.No." ,
      "Total Tonne",
      "Name" ,
      "Tel",
      "Bank A/C ",
      "Rate" ,
      "Advance" ,
      "Paid",
      "Balance" ,
      "Name",
      "Amount" ,
      "Invoice Date" ,
      "Invoice",
    ]
      ) do |csv|
  csv << [
@order.inquiry_date,
@order.no,
@order.shipper,
@order.remarks,
@order.datetime,
@order.truck_size,
@order.goods_description,
@order.pick_up_address_1 ,
@order.pick_up_pic_no_1,
@order.notes,
@order.trucks_capacity,
@order.truck_reg_no,
("#{@order.name}"+"\n"+" #{@order.ic}"),
@order.phone_no,
@order.drop_point_date,
@order.drop_point_address_1,
@order.drop_point_pic_no_1,
@order.special_request,
@order.delivery_date,
@order.do_request_date,
@order.do_collection_date,
@order.do_number,
@order.total_tonne,
@order.payment_name,
@order.tel_no,
@order.account_no,
@order.payment_with_gst,
@order.payment_advance,
@order.payment_paid,
@order.payment_balance,
@order.billing_name,
@order.billing_amount,
@order.invoice_date,
@order.invoice
  ]
    end
    file.rewind
    a = file.path
    attachments['report.csv'] = File.read(a)
    # if @order.user_email == "izzuddin@ikargo.com"
      mail(to: ["izzuddin@ikargo.com", "izzuddin91@me.com", "mu@ikargo.com", "richard@ikargo.com"],
    #     bcc: "mu@ikargo.com",
        # cc: "aru@ikargo.com",
        subject:  "New order has been created",
        date: Time.now)
    # elsif @order.user_email == "mu@ikargo.com"
    #   mail(to:"richard@ikargo.com",
    #     bcc: "aru@ikargo.com",
    #     cc: "izzuddin.muhamad@yahoo.com",
    #     subject:  "New order has been created",
    #     date: Time.now)
    # elsif @order.user_email == "richard@ikargo.com"
    #   mail(to:"mu@ikargo.com",
    #     bcc: "aru@ikargo.com",
    #     cc: "izzuddin.muhamad@yahoo.com",
    #     subject:  "New order has been created",
    #     date: Time.now)
    # elsif @order.user_email == "aru@ikargo.com"
    #   mail(to:"mu@ikargo.com",
    #     bcc: "richard@ikargo.com",
    #     cc: "izzuddin.muhamad@yahoo.com",
    #     subject:  "New order has been created",
    #     date: Time.now)
    # end
    File.delete
  end

  def edit_order(order)
   @order = order
   mail(to: ["izzuddin@ikargo.com", "izzuddin91@me.com", "mu@ikargo.com", "richard@ikargo.com"],
    subject:  "Changes on shipments details",
    date: Time.now)
   
    #  if @order.user_email == "izzuddin@ikargo.com"
    #   mail(to: "richard@ikargo.com",
    #     bcc: "mu@ikargo.com",
    #     cc: "aru@ikargo.com",
    #     subject:  "Changes on shipments details",
    #     date: Time.now)
    # elsif @order.user_email == "mu@ikargo.com"
    #   mail(to:"richard@ikargo.com",
    #     bcc: "aru@ikargo.com",
    #     cc: "izzuddin.muhamad@yahoo.com",
    #     subject:  "Changes on shipments details",
    #     date: Time.now)
    # elsif @order.user_email == "richard@ikargo.com"
    #   mail(to:"mu@ikargo.com",
    #     bcc: "aru@ikargo.com",
    #     cc: "izzuddin.muhamad@yahoo.com",
    #     subject:  "Changes on shipments details",
    #     date: Time.now)
    # elsif @order.user_email == "aru@ikargo.com"
    #   mail(to:"mu@ikargo.com",
    #     bcc: "richard@ikargo.com",
    #     cc: "izzuddin.muhamad@yahoo.com",
    #     subject:  "Changes on shipments details",
    #     date: Time.now)
    # end


  end
end



