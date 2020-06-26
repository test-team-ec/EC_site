class Admin::CustomersController < ApplicationController
	def index
		@customers = Customer.with_deleted.all
	end

	def show
		@customer = Customer.with_deleted.find(params[:id])
	end

	def edit
		@customer = Customer.with_deleted.find(params[:id])
	end

	def update
		@customer = Customer.with_deleted.find(params[:id])
		@customer.update(customer_params)
		redirect_to admin_customers_path(@customer)
	end

	private
	def customer_params
		params.require(:customer).permit(:first_name, :last_name, :first_name_phonetic,
			:first_name_phonetic, :tel, :postcode, :address, :email, :password, :is_active)
	end
end
