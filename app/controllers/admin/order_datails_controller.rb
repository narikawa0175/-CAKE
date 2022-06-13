class Admin::OrderDatailsController < ApplicationController
 def update
  @data = OrderDatail.find(params[:id])
  @data.update(data_params)

  count = 0
  @data.order.order_datails.each do |order_datail|
   if order_datail.production_status == "complete"
    count += 1
   end
  end
 
  @data.order.update(making_status: 3) if count == @data.order.order_datails.count
  @data.order.update(making_status: 2) if @data.production_status=="production"
  redirect_to admin_order_path(@data.order_id)
 end
 
 private
  def data_params
   params.require(:order_datail).permit(:production_status)
  end
end
