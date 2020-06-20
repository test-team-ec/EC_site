class OrdersController < ApplicationController
  def index
      @orders = Order.all
  end

  def show
      @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @order = Order.find(order_params)
  end

  def create
    @order = current_user
    @order.save
  end

  def confirm
  end

  def complete
  end

  private

    def order_params
     @order = Proposal.new(params.require(:order).permit(:name, :adrres, :postcode, :total_products_cost, :payment_method)
    end

end
