class OrderController < ApplicationController

  def new
    @order          = customer.orders.build
    @order.status   = "new"
    @order.pst_rate = order.customer.province.pst
    @order.gst_rate = order.customer.province.gst
    @order.hst_rate = order.customer.province.hst
  end



end