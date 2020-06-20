class OrdersController < ApplicationController
  def index
      @orders = Order.all
  end

  def show
      @order = Order.find(params[:id])
  end

  def new
    @customer = Customer.new(customer_params)
    @customer = Customer.find(params[:address])
  end

  def create
    @customer = Customer.new(customer_params)
  end

  def confirm
    @order.save
  end

  def complete
  end

  private

    def order_params
     @order = Proposal.new(params.require(:order).permit(:name, :adrres, :postcode, :total_products_cost, :payment_method))
    end

end
