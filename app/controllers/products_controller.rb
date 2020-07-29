class ProductsController < ApplicationController

  def index
    @TAX = 1.08
    @all_products = Product.all
    @genre = "全商品一覧"

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

    #商品一覧表示しないものチェック
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
    @TAX = 1.08

    #ジャンル検索
    @genres = Genre.where(invalid_status: true)

    #商品値段計算
    @product = Product.find(params[:id])
    @price = (@product.price_excluding * @TAX).ceil
  	if client_user_signed_in?
      @cart = Cart.new
      @client_user = current_client_user
  	else
    end
  end

  def search
    @TAX = 1.08
    @all_products = Product.where(genre_id: params[:format])

    #ジャンル検索
    @genres = Genre.where(invalid_status: true)
    @genre = Genre.find(params[:format]).name + "一覧"

    #退会ユーザーをアクセスさせない
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
      end

    per = 8
    #ジャンル抽出
    genres = Genre.where(invalid_status: true)
    @products = @all_products.where(out_of_stock: false, genre_id: genres.pluck(:id)).page(params[:page]).per(per)
    render :index
   end
end