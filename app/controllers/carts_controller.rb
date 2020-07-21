class CartsController < ApplicationController

  def index
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
    if @cart.save
      redirect_to request.referer, notice: "カートに初品を入れました"#保存された場合の移動先を指定。
    else
      @cart = Cart.new
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
