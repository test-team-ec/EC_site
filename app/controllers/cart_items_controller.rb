class CartItemsController < ApplicationController
  def confirm
    @cart_items = CartItem.all
  end

  def update
     @cart_item = CartItem.find(params[:id])
     @cart_item.update(cart_item_params)
     redirect_to cart_items_confirm_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_confirm_path
  end

  def destroy_all
     CartItem.where(customer_id: current_customer.id).destroy_all #カートに紐づいてるユーザーのid取得
     redirect_to cart_items_confirm_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_confirm_path
  end



  private
	def current_cart_item

		CartItem.find(session[:product_id])

		rescue ActiveRecord::RecordNotFound
			cart_item = cart_item.create
			session[:product_id] = product.id
			cart_item
	end

  def cart_item_params
  	params.require(:cart_item).permit(:customer_id, :product_id, :count)
  end
end
