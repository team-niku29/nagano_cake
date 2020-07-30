class OrderItemsController < ApplicationController
  before_action :authenticate_client_user!
  def create
  	@order_item = new(order_item_params)
  	@order_item.production_status = 0
  	@order_item.save
  	@client_user = current_client_user
    @carts = @client_user.carts
    @carts.destroy_all
  	redirect_to client_user_thanks_path
  end

  private

  def order_item_params
    params.require(:order_item).permit(:order_id,:product_id,:name, :price, :quantity)
  end

end
