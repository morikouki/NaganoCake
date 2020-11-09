class User::ShippingsController < ApplicationController

	def index
	end

	private
	def shipping_params
		params.require(:shipping).permit(:name, :address, :post_code)
	end
end
