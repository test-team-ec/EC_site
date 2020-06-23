class CustomersController < ApplicationController
  def show
  	@customer = current_customer

  end

  def edit
  	@customer = current_customer
  end

  def update
  	@customer = current_customer
  	@customer.update
  	redirect_to customers_path
  end

  def delete
  	@customer = current_customer
  end

  def destroy
  	@customer = current_customer
   	@customer.update(is_active: "退会済")
  	@customer.destroy
  	redirect_to root_path
  end
end
