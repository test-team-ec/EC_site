class CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def update
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
