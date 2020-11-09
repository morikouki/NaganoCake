class User::ShippingsController < ApplicationController

	def index
		@shipping = Shipping.new
		@shippings = Shipping.all
	end

	def create
		shipping = current_customer.shippings.new(shipping_params)
		shipping.save
		redirect_to user_shippings_path
	end

	def edit
		@shipping = Shipping.find(params[:id])
	end

	def update
		shipping = Shipping.find(params[:id])
		shipping.update(shipping_params)
		redirect_to user_shippings_path
	end

	def destroy
		shipping = current_customer.shippings.find_by(params[:shipping_id])
		shipping.destroy
		redirect_to user_shippings_path
	end

	private
	def shipping_params
		params.require(:shipping).permit(:name, :address, :post_code)
	end
end
