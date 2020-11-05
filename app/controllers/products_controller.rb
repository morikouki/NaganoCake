class ProductsController < ApplicationController

	def new
		@product = Product.new
	end

	def index
		@products = Product.all
	end

	def create
		product = Product.new(product_params)
		genre = Genre.find(prams[:genre_id])
		product.genre_id = genre.id
		product.save
		redirect_to products_path
	end

	private
	def product_params
		params.require(:product).permit(:name, :image, :explain, :status, :price)
	end
end

