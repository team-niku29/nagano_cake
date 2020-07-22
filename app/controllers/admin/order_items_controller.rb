class Admin::OrderItemsController < ApplicationController
    def update
    @item = OrderItem.find(params[:id])
    @item.update(status_params)
    binding.pry
    redirect_to admin_client_user_orders_path
    end

    private

    def status_params
        params.require(:item).permit(:production_status)
    end

end
