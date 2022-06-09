class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
   @users=Customer.page(params[:page])
  end

  def show
   @user=Customer.find(params[:id])
  end

  def edit
   @user=Customer.find(params[:id])
  end
  
  def update
   @user=Customer.find(params[:id])
   @user.update(user_params)
   redirect_to admin_customer_path(@user.id)
  end
  
  private
  def user_params
   params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:email,:is_active)
  end
end
