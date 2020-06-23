class Admin::OrderDetailsController < ApplicationController
	def update
		@order_detail = OrderDetail.find(params[:id])
		@order = Order.find(@order_detail.order_id)
		@all_order_details = OrderDetail.where(order_id: @order.id)
		@complete_order_details = @all_order_details.where(work_status: "制作完了")
		@order_detail.update(order_detail_params)
		if @order_detail.work_status == "製作中"
			@order.update(order_status: "製作中")
		end
		if @all_order_details.count == @complete_order_details.count
			@order.update(order_status: "発送準備中")
		end
		redirect_to admin_order_path(@order)
	end

	private
	def order_detail_params
		params.require(:order_detail).permit(:work_status)
	end
end
