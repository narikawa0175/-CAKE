class Admin::OrderDatailsController < ApplicationController
 def update
  @data=OrderDatail.find(params[:id])
  @data.update(data_params)
  redirect_to admin_order_path(@data.order_id)
 end
 
 private
  def data_params
   params.require(:order_datail).permit(:production_status)
  end
end
