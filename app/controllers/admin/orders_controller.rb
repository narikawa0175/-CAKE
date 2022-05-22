class Admin::OrdersController < ApplicationController
  def show
   @order=Order.find(params[:id])
   @deta=@order.order_datails
   @order_data=OrderDatail.find(params[:id])
   @total=0
  end
end
