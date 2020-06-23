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
		@order = Order.find(params[:id])
		@order_details = OrderDetail.where(params[:order_id])
		@order.update(order_params)
		if @order.order_status == "入金確認"
			@order_details.each do |order_detail|
				order_detail.update(work_status: "制作待ち")
			end
		end
		redirect_to admin_order_path(@order)
	end

	private
	def order_params
		params.require(:order).permit(:order_status)
	end

end
