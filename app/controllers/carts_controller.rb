class CartsController < ApplicationController

  def index
<<<<<<< HEAD
    @total = 0                #合計計算用
    @carts = Cart.all
    @client_user = current_client_user
  end

  def create
    @cart = Cart.new(cart_params) #cartモデルのテーブルを使用しているのでcartコントローラで保存する。
    @client_user = current_client_user
    @product = Product.find(params[:id])
    @cart.client_user_id == @client_user.id
    @cart.product_id == @product.id
=======
    @carts = Cart.all
    @total = 100
  end

  def create
    @cart = Cart.new(cart_params) #Bookモデルのテーブルを使用しているのでbookコントローラで保存する。
    @cart.user_id = current_user.id
>>>>>>> e0e120ec1dcb8e9fda400c8b4883e520a88ae60c
    if @cart.save
      redirect_to request.referer, notice: "カートに初品を入れました"#保存された場合の移動先を指定。
    else
      @cart = Cart.new
<<<<<<< HEAD
=======
      @product = Product.find(params[:id])
>>>>>>> e0e120ec1dcb8e9fda400c8b4883e520a88ae60c
      render 'carts/show'
    end
  end

  def update
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to request.referer, notice: "商品をカートから取り出しました!"
  end

  def all_destroy
  end

  private

  def cart_params
    params.require(:cart).permit(:quantity)
  end

end
