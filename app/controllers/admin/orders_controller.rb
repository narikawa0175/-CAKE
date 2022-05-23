class Admin::OrdersController < ApplicationController
  def show
   @order=Order.find(params[:id])
   @deta=@order.order_datails
   @order_data=OrderDatail.find(params[:id])
   @total=0
  end
  
  def update
   @order=Order.find(params[:id])
   @order.update(order_params)
   redirect_to admin_order_path(@order.id)
  end
  
  private
   def order_params
    params.require(:order).permit(:making_status)
   end
end
