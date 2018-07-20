class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def receipt_email(order, orderItems, orderID)
    @order = order
    @orderItems = orderItems
    @orderID = orderID

    mail(to: 't.campbell@sasktel.net', subject: @orderID)
  end
end
