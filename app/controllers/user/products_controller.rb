class User::ProductsController < ApplicationController

	def top
		@genres = Genre.all
		@products = Product.order("RANDOM()").all
	end


	def index
	end
end
