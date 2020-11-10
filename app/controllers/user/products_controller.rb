class User::ProductsController < ApplicationController

	before_action :tax_price, only: [:show]


	def top
		@genres = Genre.all
		@products = Product.order("RANDOM()").all
	end


	def index
		@genres = Genre.all
		if params[:genre_id]
			@genre = Genre.find(params[:genre_id])
			@products = Product.where("genre_id LIKE?", "#{@genre.id}")
		else
			@products = Product.all
		end
	end

	def show
		@genres = Genre.all
		@product = Product.find(params[:id])
	end

	private

	def tax_price
		tax = 0.1
		@product = Product.find(params[:id])
		@tax_price = @product.price * tax
		@tax_price = @product.price + @tax_price
	end

end
