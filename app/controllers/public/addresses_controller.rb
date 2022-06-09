class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  def index
   @address=Address.new
   @customer=Customer.find(params[:id])
   @addresses=@customer.addresses
  end

  def edit
   @address=Address.find(params[:id])
  end

  def create
   @address=Address.new(address_params)
   @address.customer_id=current_customer.id
   if @address.save
    redirect_to addresses_path(current_customer.id)
   else
    @customer=Customer.find(current_customer.id)
    @addresses=@customer.addresses
    render :index
   end
  end

  def update
   address=Address.find(params[:id])
   address.update(address_params)
   redirect_to addresses_path(current_customer.id)
  end

  def destroy
   @address=Address.find(params[:id])
   @address.destroy
   redirect_to addresses_path(current_customer.id)
  end
  
  private
  
  def address_params
   params.require(:address).permit(:postal_code,:address,:name)
  end
end
