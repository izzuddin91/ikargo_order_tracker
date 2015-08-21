class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.create_edit_order.subject
  #
  def create_edit_order(order)
    @order = order
    mail(to: "izzuddin@ikargo.com",
     subject:  "New order has been created",
     date: Time.now)
  end


  def edit_order(order)
     @order = order
     mail(to: "izzuddin@ikargo.com",
     subject:  "Changes on shipment's details",
     date: Time.now)
  end
end
