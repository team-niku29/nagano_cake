class OrdersController < ApplicationController
  def index
    @client_user = current_client_user
    @orders = @client_user.orders
    #@order_items = @orders.order_items
  end

  def create
    @order = Order.new(order_params)
    @order.status_flg = 0
    render "order_items/create"
  end


  def show
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

    #支払い方法条件分岐
    @payment_flg = params[:order][:payment_flg]
    if @payment_flg == "0"
      @payment = "クレジットカード"
    else
      @payment = "銀行振込"
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
      @postal_code = params[:order][:postal_code]
      @shipping_address = params[:order][:shipping_address]
      @full_name = params[:order][:shipping_name]
      #新しい住所の空白チェック
      if @postal_code == ""
        redirect_to request.referer, notice: "新しいお届け先の郵便番号を入力してください"
      elsif @shipping_address == ""
        redirect_to request.referer, notice: "新しいお届け先の住所を入力してください"
      elsif @full_name == ""
        redirect_to request.referer, notice: "新しいお届け先の宛名を入力してください"
      else
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
