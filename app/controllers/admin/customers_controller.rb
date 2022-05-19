class Admin::CustomersController < ApplicationController
  def index
   @users=Customer.all
  end

  def show
  end

  def edit
  end
end
