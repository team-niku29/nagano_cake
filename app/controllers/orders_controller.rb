class OrdersController < ApplicationController
  def index
  end

  def create
  end

  def show
  end

  def address_check
    @address = Address.new
    @client_user = current_client_user
    @addresses = @client_user.addresses
  end

  def order_check
  end

  def thanks
  end
end
