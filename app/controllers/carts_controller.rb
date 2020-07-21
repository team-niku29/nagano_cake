class CartsController < ApplicationController

  def index
    @carts = Cart.all
    @total = 100
  end

  def create
    @cart = Cart.new(cart_params) #Bookモデルのテーブルを使用しているのでbookコントローラで保存する。
    @cart.user_id = current_user.id
    if @cart.save
      redirect_to request.referer, notice: "カートに初品を入れました"#保存された場合の移動先を指定。
    else
      @cart = Cart.new
      @product = Product.find(params[:id])
      render 'carts/show'
    end
  end

  def update
  end

  def destroy
  end

  def all_destroy
  end

  private

  def cart_params
    params.require(:cart).permit(:name, :quantity)
  end

end
