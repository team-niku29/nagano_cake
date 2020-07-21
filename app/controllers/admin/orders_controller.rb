class Admin::OrdersController < ApplicationController
  def top
    @orders = Order.all
  end

  def index
    case params[:order_sort]
    when "0"
      @orders = Order.where(created_at: Date.today)
    when "1"
      @user = ClientUser.find(params[:id]) #idの取得方法はあとで考えます Shoki
      @orders = @user.orders
    else
      @orders = Order.all
    end
    @orders = Order.all
  end
  
  def show
    @order = Order.find(1)
    @statuses = Order.select(:status_flg)
    @items = OrderItem.all
    @total_price = 0
    @items.each do |item|
      @total_price += item.price * item.quantity
      @total_price *= $tax
    end
  end

  def update
  end
end
