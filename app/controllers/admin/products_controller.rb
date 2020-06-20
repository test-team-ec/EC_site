class Admin::ProductsController < ApplicationController
	def index
	end

	def show
	end

	def edit
	end

	def update
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new
	end

	private

	def product_params
		params.require(:product).permit(:name, :introduction, :price)
	end
end
