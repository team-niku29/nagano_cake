class Admin::OrderItemsController < ApplicationController
    def update
    @item = OrderItem.find(params[:id])
    @item.update(status_params)
    redirect_to admin_client_user_orders_path
    end
    

end
