class OrdersController < ApplicationController
  def index
  end

  def create
  end

  def show
  end

  def address_check
    #@client_user = current_user
    @payment = ""
    @postal_code = ""
    @shipping_address = ""
    @shipping_name = ""
  end

  def order_check
  end

  def thanks
  end
end
