class Admin::CustomersController < ApplicationController
	def index
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		customer = Customer.find(params[:id])
		customer.update(customer_params)
		redirect_to customer_path(customer.id)
	end
end
