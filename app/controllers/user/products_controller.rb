class User::ProductsController < ApplicationController

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

end
