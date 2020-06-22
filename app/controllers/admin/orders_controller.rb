class Admin::OrdersController < ApplicationController
	def index
		@orders = Order.all.order(id:"DESC")
		@order_details = OrderDetail.where(params[:order_id])
		@total_count = @order_details.all.sum(:count)
	end

	def show
		@order = Order.find(params[:id])
		@order_details = OrderDetail.where(params[:order_id])
	end

	def update
	end
end
