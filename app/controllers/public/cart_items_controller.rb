class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
   @cart_items=CartItem.all
   @cart_item=current_customer.cart_items.all
   @total=@cart_item.inject(0){|sum,item| sum+item.subtotal}
  end
  
  def update
   @cart_item=CartItem.find(params[:id])
   @cart_item.update(cart_item_params)
   redirect_to cart_items_path
  end
  
  def destroy
   @cart_item=CartItem.find(params[:id])
   @cart_item.destroy
   redirect_to cart_items_path
  end
  
  def destroy_all
   @cart_item=current_customer.cart_items
   @cart_item.destroy_all
   redirect_to cart_items_path
  end
  
  def create
   @cart_item=CartItem.new(cart_item_params)
   @cart_item.customer_id=current_customer.id
   if @cart_item.save
    redirect_to cart_items_path
   else
    @item=Item.find(@cart_item.item_id)
    render 'public/items/show'
   end
  end
  
  private
  
  def cart_item_params
   params.require(:cart_item).permit(:item_id,:amount)
  end
end
