class ProductsController < ApplicationController


  def index
  end

  def show

    @product = Product.find(params[:id])
    @price = (@product.price_excluding * $tax).ceil
  	if client_user_signed_in?
      @cart = Cart.new
      @client_user = current_client_user
      @cart.product_id = @product.id
  	else
  	end
  end

end
