class CartItemsController < ApplicationController

  def confirm
    @cart_item = CartItem.where(customer_id: current_user.id)
    @cart_item = CartItem.all
    @total_price = 0
    @cart_item.each do |cart_item|
     @total_price += cart_item.product_price
   end
  end

  def update
     @cart_item.count += params[:count].to_i
     @cart_item.products_id
     @cart_item.update
     redirect_to cart_items_confirm_path
  end

  def create
    @cart_item.count += params[:count].to_i
    @cart_item.products_id
    @cart_item.save
  end

  def destroy_all
    @cart_item.destroy
    redirect_to cart_items_confirm_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destoroy
    ridirect_to cart_items_confirm_path
  end

  private
	def cart_item

		CartItem.find(session[:product_id])

		rescue ActiveRecord::RecordNotFound
			cart_item = cart_item.create
			session[:product_id] = product.id
			cart_item
	end


end
