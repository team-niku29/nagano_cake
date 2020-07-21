class ProductsController < ApplicationController

  def index
  end

  def show
  	@cart = Cart.new
    @product = Product.find(params[:id])
  	#if user_signed_in?
  		#@client_user = current_user
  	#else
  	#end
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to request.referer
  end

  private

  def product_params
  	params.require(:product).permit(:name,:introduction,:price_excluding)
  end

end
