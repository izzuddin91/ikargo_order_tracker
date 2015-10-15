
class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.create_edit_order.subject
  #
  def create_edit_order(order, a)
     @order = order
    # if @order.user_email == "izzuddin@ikargo.com"
      mail(to: [a.to_s],
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

  end

  def edit_order(order, a)
   @order = order
   mail(to: [a.to_s],
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



