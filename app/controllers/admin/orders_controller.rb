class Admin::OrdersController < ApplicationController
  def top
    @orders = Order.all
  end

  def index
    case params[:order_sort]
    when "0"
      @orders = Order.where(created_at: Date.today)
    when "1"
      @orders = ClientUser.find(params[:client_user_id]).orders
    else
      @orders = Order.all
    end
    @orders = Order.all
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
