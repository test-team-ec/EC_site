class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @order = Order.new
    @order.customer_id = current_user.id
  end

  def create
    @order.customer_id = current_user.id
    @order.save
    redirect_to orders_complete_path
  end

  def confirm
    @order = Order.where(customer_id: current_user.id)
    @order = Oreder.all
  end

  def complete
  end

  private
  def order_params
  	params.require(:order).permit(:postcode, :address, :name)
  end
end
