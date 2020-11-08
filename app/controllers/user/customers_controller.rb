class User::CustomersController < ApplicationController


	def my_page
		@customer = current_customer
	end

	def edit
		@customer = current_customer
	end

	def update
	end

	def confirm
	end

	def withdraw
	end

	private
	def customer_params
		params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :phone_number, :address, :is_deleted)
	end
end
