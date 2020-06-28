class ShippingsController < ApplicationController
  def index
      @shippings = Shipping.where(customer_id: current_customer.id)
      @shipping = Shipping.new
  end

  def new
  end

  def create
      @shipping = Shipping.new(shipping_params)
      @shipping.customer_id = current_customer.id
      if  @shipping.save
          redirect_to customers_shippings_path
      else
        @shippings = Shipping.all
        render 'index'
      end
  end


  def show
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end

  def update
    @shipping = Shipping.find(params[:id])
    @shipping.customer_id = current_customer.id
    @shipping.update(shipping_params)
    redirect_to customers_shippings_path
  end

  def destroy
      @shipping = Shipping.find(params[:id])
      @shipping.destroy
      redirect_to customers_shippings_path
  end

  private

  def shipping_params
    params.require(:shipping).permit(:customer_id, :postcode, :address, :name)
  end
end



