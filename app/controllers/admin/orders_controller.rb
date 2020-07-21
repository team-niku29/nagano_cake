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
  end

  def update
  end
end
