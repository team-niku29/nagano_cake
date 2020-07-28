class ProductsController < ApplicationController

  def index
    #ジャンル検索
    @genres = Genre.where(invalid_status: true)
    #管理者をアクセスさせない
    if admin_signed_in?
        redirect_to destroy_admin_session_path
    end
    #退会ユーザーをアクセスさせない
    
    if client_user_signed_in?
      if current_client_user.delete_status == true
        redirect_to destroy_client_user_session_path
      end
    end

    #商品一覧表示しない
    @TAX = 1.08
    @all_products = Product.all
    @number = 0
    @loop = 0

    @all_products.each do |product|
      if product.out_of_stock == false
        if product.genre.invalid_status == true
          @number = @number + 1
        else
        end
      else
      end
    per = 8
    genres = Genre.where(invalid_status: true)
    @products = Product.where(out_of_stock: false, genre_id: genres.pluck(:id)).page(params[:page]).per(per)
    end
  end
  
  def show
    @genres = Genre.where(invalid_status: false)
    @TAX = 1.08
    @product = Product.find(params[:id])
    @price = (@product.price_excluding * @TAX).ceil
  	if client_user_signed_in?
      @cart = Cart.new
      @client_user = current_client_user
  	else
    end
  end

  def search
  #   @genres = Genre.where(invalid_status: false)
  #   @products = Product.where(genre_id: params[:format])
  #   @all_products = Product.all
  #   @number = 0
  #   @all_products.each do |product|
  #     if product.out_of_stock == false
  #       @number = @number + 1
  #     else
  #     end
  #   end
  #   @TAX = 1.08
  #   @loop = 0
  #   render :index
   end
end