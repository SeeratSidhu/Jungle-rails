class OrderMailer < ApplicationMailer

  def order_confirmation(orderId)
    @order = Order.find(orderId)
    @line_items = @order.line_items
    mail(to: @order.email, subject: "Thanks for your Jungle order: #{@order.id}!")
  end
end
