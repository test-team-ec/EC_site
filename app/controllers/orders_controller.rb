class OrdersController < ApplicationController
  def index
      @orders = Order.all
  end

  def show
      @order = Order.find(params[:id])
  end

  def new
    @order_address = OrderAddress.new(order_address_params)
  end

  def create
    @order  = current_customer.find(params[:customer_id])
    @order = PaymentMethod.find(params[:payment_method])
    @adrres = adrres_option
    if adrres_option == 0
      @customer.address
    elsif adrres_option == 1
      @current_customer.shipping.address
    elsif adrres_option == 2
      @order_adress.new
    end
  end

  def confirm
    @order  = current_customer.order.find(params[:customer_id])
    @payment = PaymentMethod.find(params[:payment_method])
    @address = AdrressOption.find(params[:address])
    @order.save
    redirect_to root_path
  end

  def complete
  end



  private

    def order_adress_params
     @order_address = OrderAress.new(params.require(:order).permit(:address, :postcode, :payment_method, :name))
    end


end
