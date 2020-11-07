class User::CustomersController < ApplicationController

	private
	def customer_params
		params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :phone_number, :address, :is_deleted)
end
