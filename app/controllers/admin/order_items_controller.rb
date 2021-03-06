class Admin::OrderItemsController < ApplicationController

  before_action :authenticate_admin!

    def update
      @item = OrderItem.find(params[:id])
      @item.update(status_params)
      redirect_to admin_client_user_order_path(@item.order.client_user_id, @item.order_id)

    end

    def status_params
      params.require(:order_item).permit(:production_status)
    end
end
