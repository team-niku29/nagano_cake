class Admin::OrdersController < ApplicationController
  def top
    @orders = Order.all
  end

  def index
    @orders = Order.all

  end
  
  def show
  end

  def update
  end
end
