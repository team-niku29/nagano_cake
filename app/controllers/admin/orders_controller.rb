class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  layout 'admin'

  def top
    @orders = Order.today_orders.count
  end

  def index
    case params[:order_sort]
    when "0"
      @orders = Order.today_orders.order(created_at: "DESC")
    when "1"
      @orders = Order.where(client_user_id: params[:client_user_id]).order(created_at: "DESC")
    else
      @orders = Order.all.order(created_at: "DESC")
    end
  end
  
  def show
    @TAX = 1.08
    @order = Order.find(params[:id])
    @items = @order.order_items
    @total_price = 0
    @items.each do |item|
      @total_price += item.price * item.quantity
    end
    @total_price *= @TAX
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
