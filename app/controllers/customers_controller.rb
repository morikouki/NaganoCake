class CustomersController < ApplicationController

	def index
		@customers = Customer.all
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		customer = Customer.find(params[:id])
		customer.update(customer_params)
		redirect_to customer_path(customer)
	end

	private
	def customer_params
		params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :phone_number, :address, :is_deleted)
	end
end
