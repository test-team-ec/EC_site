class CustomersController < ApplicationController
  def show

  end

  def edit
  	@customer = current_customer
  end

  def update
  	customer = Customer.find(params[:id])
  	customer.update(customer_params)
  	redirect_to Customers_path(customer.id)
  end

  def destroy
  end
end
