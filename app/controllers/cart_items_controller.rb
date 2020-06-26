class CartItemsController < ApplicationController
  def confirm
    @cart_items = CartItem.all
  end

  def update
     @cart_item = CartItem.find(params[:id])  #カート内の商品取得
     @cart_item.update(cart_item_params)
     redirect_to cart_items_confirm_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)  #ステータス渡す為の空のカート作成
    @cart_item.customer_id = current_customer.id #カートのidはユーザーと同じと定義
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





  def cart_item_params #カートに送られるステータス
  	params.require(:cart_item).permit(:customer_id, :product_id, :count)
  end
end
