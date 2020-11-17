class User::CartItemsController < ApplicationController

	def index
	end

	def create
		@cart_item = current_customer.cart_items.new(cart_item_params)
    	@cart_items = current_customer.cart_items
      	if @now_cart_item = current_customer.cart_items.find_by(product_id: @cart_item.product_id)
        	@now_cart_item.amount = @cart_item.amount + @now_cart_item.amount
        	@now_cart_item.update(amount: @now_cart_item.amount)
        	@cart_item.destroy
      	end
    	@cart_item.save
    	redirect_to User_cart_items_path

	end

	def update
	end

	def destroy
	end

	def destroy_all
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:amount)
	end
end
