class Admin::ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])

	end

	def edit
		@product = Product.find(prams[:id])
	end

	def update
		@product = Product.find(prams[:id])
		@product.update(product_params)
	end

	def new
		@product = Product.new
		
	end

	def create
		@product = Product.new(product_params)
		@product.save
		redirect_to admin_products_path(@product)
	end

	private
  def product_params
  	params.require(:product).permit(:name, :introduction, :price, :genre_id, :product_image, :is_active)
  end
end
