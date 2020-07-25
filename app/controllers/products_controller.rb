class ProductsController < ApplicationController

  def index
  end

  def show
    @TAX = 1.08
    @product = Product.find(params[:id])
    @price = (@product.price_excluding * @TAX).ceil
  	if client_user_signed_in?
      @cart = Cart.new
      @client_user = current_client_user
  	else
  	end
  end

end
