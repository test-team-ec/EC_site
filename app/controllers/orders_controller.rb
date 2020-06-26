class OrdersController < ApplicationController
  def index
      @orders = Order.where(customer_id: current_customer.id).order(id:"DESC")
  end

  def show
      @order = Order.find(params[:id])
      @order_details = OrderDetail.where(order_id: @order.id)
  end

  def new
    @order = Order.new
    @customer_address = Shipping.where(customer_id: current_customer.id)
    @customer = current_customer
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
       cart_items = current_customer.cart_items #カートアイテムを全取得
        cart_items.each do |cart_item|
          order_detail = @order.order_details.new #履歴の空を作成
          order_detail.product_id = cart_item.product_id #カートの商品を取得
          order_detail.count = cart_item.count
          order_detail.price = cart_item.product.price
          order_detail.save  # 注文履歴をセーブ
          cart_item.destroy  #カート内アイテムを空に削除
        end
      redirect_to orders_complete_path
    else
      redirect_to new_customers_order_path
    end


  end

  def confirm
    @order_products = current_customer.cart_items.all
    @order = Order.new
    if params[:addresses] == "1"
      @order.address = current_customer.address
      @order.postcode =  current_customer.postcode
      @order.name =  current_customer.first_name

    elsif params[:addresses] == "2"
       @shipping = Shipping.find(params[:select_address])
       @order.postcode = @shipping.postcode
       @order.address = @shipping.address
       @order.name = @shipping.name

     else params[:addresses] == "3"
       @shipping = Shipping.new
       @order.postcode = params[:postcode]
       @order.address = params[:address]
       @order.name = params[:name]

       @shipping.customer_id = current_customer.id
       @shipping.postcode = @order.postcode
       @shipping.address = @order.address
       @shipping.name = @order.name
       @shipping.save
    end
  end

  def complete
  end



  private

    def order_params
     params.permit(:address, :postcode, :postage, :payment_method, :name, :customer_id,:total_products_cost, :order_status)
    end


end
