class OrdersController < ApplicationController

  def index
  end

  def create
    #orderレコードの作成
    params[:order][:payment_flg] = params[:order][:payment_flg].to_i
    @order = Order.new(order_params)
    @client_user = current_client_user
    @order.client_user_id = @client_user.id
    @order.status_flg = 0
    @order.save

    #order_itemレコードの作成
    @order_items = @client_user.carts

    @order_items.each do |order_item|
      @product = Product.find(order_item.product_id)
      @order_item = OrderItem.new
      @order_item.order_id = @order.id
      @order_item.product_id = order_item.product_id
      @order_item.name = @product.name
      @order_item.price = @product.price_excluding
      @order_item.quantity = order_item.quantity
      @order_item.production_status = 0
      @order_item.save
    end

    #cartの中身を空にする
    @client_user = current_client_user
    @carts = @client_user.carts
    @carts.destroy_all
    redirect_to client_user_thanks_path
  end

  def show
    @order = Order.find(params[:id])
    @subtotal = @order.total_quantity * @order.total_quantity
    @order_items = @order.order_items
    @total_price = 0
    @order_items.each do |item|
      @total_price += item.price * item.quantity
    end
  end

  def address_check
    @order = Order.new
    @client_user = current_client_user
    @addresses = @client_user.addresses
  end

  def order_check
    @TAX = 1.08    #税込価格計算用、税率8％
    @price = 0     #商品税込価格用
    @subtotal =0   #小計計算用
    @total = 0     #金額合計計算用初期化
    @total_quantity = 0   #個数合計計算用初期化

    @order = Order.new
    @client_user = current_client_user
    @carts = @client_user.carts

    #totalとtotal_quantityを計算
    @carts.each do |cart|
      @price = (cart.product.price_excluding * @TAX).ceil
      @subtotal = @price * cart.quantity
      @total_quantity = @total_quantity + cart.quantity
      @total = @total + @subtotal
    end

    #支払い方法条件分岐
    @payment_flg = params[:order][:payment_flg]
    if @payment_flg == "0"
      @payment = "クレジットカード"
    elsif @payment_flg == "1"
      @payment = "銀行振込"
    else
      redirect_to request.referer, notice: "支払い方法を選択してください"
    end

    #お届け先条件分岐
    @address_selection = params[:address_selection]
    @address_id = params[:address][:address_id]
    if @address_selection == "0"
      @postal_code = @client_user.postal_code
      @shipping_address = @client_user.address
      @full_name = @client_user.family_name + @client_user.first_name
    elsif @address_selection == "1"
      #新しい住所の空白チェック
      if @address_id == ""
        redirect_to request.referer, notice: "登録済住所を選択してください"
      else
        @address = Address.find(params[:address][:address_id])
        @postal_code = @address.postal_code
        @shipping_address = @address.address
        @full_name = @address.name
      end
    elsif @address_selection == "2"
      @address = Address.new
      @postal_code = params[:order][:postal_code]
      @shipping_address = params[:order][:shipping_address]
      @full_name = params[:order][:shipping_name]
      #addressテーブルに追加
      @address.client_user_id = @client_user.id
      @address.postal_code = @postal_code
      @address.address = @shipping_address
      @address.name = @full_name
      #新しいaddressレコード作成時のバリテーションチェック
      if @address.save
      else
        @order = Order.new
        @client_user = current_client_user
        @addresses = @client_user.addresses
        render "address_check"
      end
    else
      redirect_to request.referer, notice: "お届け先を指定して下さい"
    end
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:client_user_id,:shipping_name,:postal_code, :shipping_address, :total_quantity, :charriage, :billing_amount, :payment_flg)
  end

end
