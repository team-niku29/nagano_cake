class Admin::OrdersController < ApplicationController

  layout 'admin'

  def top
    @orders = Order.today_orders.count
  end

  def index
    case params[:order_sort]
    when "0"
      @orders = Order.today_orders
    when "1"
      @orders = Order.where(client_user_id: params[:client_user_id])
    else
      @orders = Order.all
    end
  end
  
  def show
    @order = Order.find(params[:id])
    @items = @order.order_items
    @total_price = 0
    @items.each do |item|
      @total_price += item.price * item.quantity
      @total_price *= $tax
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status_params)
    redirect_to admin_client_user_order_path(@order.id)
  end

  private

  def status_params
    params.require(:order).permit(:status_flg)
  end
  
end
