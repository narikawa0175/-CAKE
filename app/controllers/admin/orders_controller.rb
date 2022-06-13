class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
   @order=Order.find(params[:id])
   @deta=@order.order_datails
   @order.shipping_cost=800
  end
  
  def update
   @order=Order.find(params[:id])
   @data=@order.order_datails
   @order.update(order_params)
   @data.update_all(production_status: 1) if @order.making_status=="confirmation"
   redirect_to admin_order_path(@order.id)
  end
  
  private
   def order_params
    params.require(:order).permit(:making_status)
   end
end
