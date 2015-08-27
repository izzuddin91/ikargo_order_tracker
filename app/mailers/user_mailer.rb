
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
"Shipper Address",
"Transporter",
"Truck Size",
"Details",
"Route",
"Remarks",
"Pick up date",
"Goods Details",
"Pick up Address 1",
"Pick up PIC 1",
"Pick up Address 2",
"Pick up PIC 2",
"Pick up Address 3",
"Pick up PIC 3",
"Pick up Address 4",
"Pick up PIC 4",
"Drop Point Date",
"Drop Point Address 1",
"Drop Point PIC 1",
"Drop Point Address 2",
"Drop Point PIC 2",
"Drop Point Address 3",
"Drop Point PIC 3",
"Drop Point Address 4",
"Drop Point PIC 4",
"Special Request",
"Trucks Size",
"Trucks Reg no",
"Drivers Name",
"IC",
"driver phone no",
"Delivery Date",
"DO request date",
"DO collection date",
"Do number",
"Total Tonne",
"Payment Name",
"Tel No",
"Acc no",
"Rate",
"Payment Rate",
"6% GST",
"Master Total",
"Advance",
"Paid",
"Commision",
"Balance",
"Billing Name",
"Rate",
"Billing Amount",
"6% GST",
"Master Total",
"Billing Received",
"Billing Balance",
"Invoice Date",
"Invoice"
     ]
      ) do |csv|
  csv << [
@order.inquiry_date,
@order.no,
@order.shipper,
@order.shipper_address,
@order.transporter,
@order.truck_size,
@order.details,
@order.remarks ,
@order.notes,
@order.datetime,
@order.goods_description,
@order.pick_up_address_1,
@order.pick_up_pic_no_1,
@order.pick_up_address_2,
@order.pick_up_pic_no_2,
@order.pick_up_address_3,
@order.pick_up_pic_no_3,
@order.pick_up_address_4,
@order.pick_up_pic_no_4,
@order.special_request,
@order.drop_point_date,
@order.drop_point_address_1,
@order.drop_point_pic_no_1,
@order.drop_point_address_2,
@order.drop_point_pic_no_2,
@order.drop_point_address_3,
@order.drop_point_pic_no_3,
@order.drop_point_address_4,
@order.drop_point_pic_no_4,
@order.trucks_capacity,
@order.truck_reg_no,
@order.name,
@order.ic,
@order.phone_no,
@order.delivery_date,
@order.do_request_date,
@order.do_collection_date,
@order.do_number,
@order.total_tonne,
@order.payment_name,
@order.tel_no,
@order.account_no,
@order.rate,
@order.payment_rate,
@order.gst_total_value,
@order.payment_with_gst,
@order.payment_advance,
@order.payment_paid,
@order.payment_commision,
@order.payment_balance,
@order.billing_name,
@order.billing_rate,
@order.billing_amount,
@order.gst_billing_total_value,
@order.billing_with_gst,
@order.billing_received,
@order.billing_balance,
@order.invoice_date,
@order.invoice
  ]
    end
    file.rewind
    a = file.path
    attachments['report.csv'] = File.read(a)
    if @order.user_email == "izzuddin@ikargo.com "
      mail(to: "richard@ikargo.com",
        bcc: "mu@ikargo.com",
        cc: "aru@ikargo.com",
        subject:  "New order has been created",
        date: Time.now)
    elsif @order.user_email == "mu@ikargo.com"
      mail(to:"richard@ikargo.com",
        bcc: "aru@ikargo.com",
        cc: "izzuddin.muhamad@yahoo.com",
        subject:  "New order has been created",
        date: Time.now)
    elsif @order.user_email == "richard@ikargo.com"
      mail(to:"mu@ikargo.com",
        bcc: "aru@ikargo.com",
        cc: "izzuddin.muhamad@yahoo.com",
        subject:  "New order has been created",
        date: Time.now)
    elsif @order.user_email == "aru@ikargo.com"
      mail(to:"mu@ikargo.com",
        bcc: "richard@ikargo.com",
        cc: "izzuddin.muhamad@yahoo.com",
        subject:  "New order has been created",
        date: Time.now)
    end
    File.delete
  end

  def edit_order(order)
     @order = order
     mail(to: "izzuddin@ikargo.com",
     subject:  "Changes on shipment's details",
     date: Time.now)
  end
end




