class OrdersController < ApplicationController
  def index
      @orders = Order.all
  end

  def show
      @order = Order.find(params[:id])
  end

  def new
  end

  def create
  end

  def confirm
  end

  def complete
  end

end

