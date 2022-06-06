class Public::OrdersController < ApplicationController
  def new
   @order=Order.new
  end
  
  def confirm
   @cart_item=current_customer.cart_items.all
   @total=@cart_item.inject(0){|sum,item| sum+item.subtotal}
   @order=Order.new(order_params)
   @order.shipping_cost=800
   @order.billing_amount=@total+@order.shipping_cost
   case params[:order][:select_address]
   when "0"
    @order.postal_code=current_customer.postal_code
    @order.address=current_customer.address
    @order.name=current_customer.last_name+current_customer.first_name
   when "1"
    @address=Address.find(params[:order][:address_id])
    @order.postal_code=@address.postal_code
    @order.address=@address.address
    @order.name=@address.name
   end
  end
  
  def create
   @order=Order.new(order_params)
   @order.customer_id=current_customer.id
   @order.save
   @cart_item=current_customer.cart_items
   @cart_item.each do |item|
    OrderDatail.create(item_id: item.item_id,amount: item.amount,order_id: @order.id,tax_price: item.item.add_tax_price)
    item.destroy
   end
   redirect_to complete_order_path
  end

  def complete
  end

  def index
   @orders=current_customer.orders
  end

  def show
   @order=Order.find(params[:id])
   @data=@order.order_datails
  end
  
  private
  
  def order_params
   params.require(:order).permit(:method_of_payment,:postal_code,:address,:name,:billing_amount,:shipping_cost)
  end
end
