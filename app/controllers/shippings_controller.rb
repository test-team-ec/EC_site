class ShippingsController < ApplicationController
  def index
      @shippings = Shipping.all
      @Shipping = Shipping.new
  end

  def craete
      @shipping = Shipping.new(shipping_params)
      @shipping.user_id = current_user.user_id
  if @shipping.save
     redirect_to customers_shippings_path(@shipping)
     
  end


  def show
  end

  def edit
  end

  def update
  end

  def new
  end

  def destroy
  end

  private

  def shipping_params
    params.require(:shipping).permit(:postcode, :address, :name)
  end
end

