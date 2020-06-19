class CartItemsController < ApplicationController
  def confirm
    @cart_item = CartItem.all
   end
  end

  def update
     @cart_item.update(cart_item_params)
  end

  def create
    @cart_item = current_cart_item
	  product = Product.find(params[:product_id])
	  @cart_item = @cart_item.add_product(product.id)
    @cart_item.save
  end

  def destroy_all
    @cart_item.destroy
    redirect_to cart_items_confirm_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    rdirect_to cart_items_confirm_path
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
  	params.require(:cart_item).permit(:count)
  end
end
