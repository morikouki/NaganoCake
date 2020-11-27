class User::OrdersController < ApplicationController


	def index
	end

	def new
	end

	def create
	end

	def show
	end

	def confirm
	end

	def complete
	end

	private
	def order_params
		params.require(:order).permit(:post_code, :address, :name, :total_price, :shipping_cost, :payment, :status, :customer_id)
	end
end
