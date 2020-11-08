class User::ProductsController < ApplicationController

	def top
		@genres = Genre.all
		@products = Product.order("RANDOM()").all
	end


	def index
		@genres = Genre.all
		@products = Product.all
	end
end
