class ProductsController < ApplicationController

  def index
    #退会ユーザーをアクセスさせない
    if client_user_signed_in?
      if current_client_user.delete_status == true
        redirect_to destroy_client_user_session_path
      end
    end

    #商品一覧表示しない
    @TAX = 1.08
    @products = Product.page(params[:page]).reverse_order
    @number = 0

    @products.each do |product|
      @number = @number + 1
    end
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
