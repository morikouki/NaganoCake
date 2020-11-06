class ProductsController < ApplicationController

	def new
		@product = Product.new
	end

	def index
		@products = Product.all
	end

	def create
		product = Product.new(product_params)
		product.save
		redirect_to products_path
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		product = Product.find(params[:id])
		product.update(product_params)
		redirect_to products_path
	end



	private
	def product_params
		params.require(:product).permit(:name, :image, :explain, :status, :price, :genre_id)
	end
end

