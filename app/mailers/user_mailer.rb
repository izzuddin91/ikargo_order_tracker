class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.create_edit_order.subject
  #
  def create_edit_order(order)
    @order = order
    mail(to: "izzuddin@ikargo.com",
     subject:  "orders created/edited",
     date: Time.now)
  end
end
