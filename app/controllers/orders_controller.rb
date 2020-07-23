class OrdersController < ApplicationController
  def index
  end

  def create
    render "order_item/create"
  end

  def show
  end

  def address_check
    @address = Address.new
    @client_user = current_client_user
    @addresses = @client_user.addresses
  end

  def order_check
    @order = Order.new
    @TAX = 1.08    #税込価格計算用、税率8％
    @price = 0     #商品税込価格用
    @subtotal =0   #小計計算用
    @total = 0     #合計計算用初期化
    @client_user = current_client_user
    @carts = @client_user.carts
    @payment = params[:payment]
    @postal_code = params[:postal_code]
    @address = params[:address]
    @name = params[:name]
  end

  def thanks
  end
end
