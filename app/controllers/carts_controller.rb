class CartsController < ApplicationController


  def index
    @total = 0                #合計計算用
    @carts = Cart.all
    @client_user = current_client_user
  end

  def create
    @cart = Cart.new(cart_params) #Bookモデルのテーブルを使用しているのでbookコントローラで保存する。
    @cart.client_user_id = current_client_user.id
    @cart.save
    redirect_to client_user_carts_path, notice: "カートに初品を入れました"#保存された場合の移動先を指定。
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
    params.require(:cart).permit(:product_id, :quantity)
  end

end
