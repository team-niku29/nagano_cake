class Admin::ClientUsersController < ApplicationController
  def index
  end

  def show
    @user = ClientUser.find(params[:id])
  end

  def edit
    @user = ClientUser.find(params[:id])
  end
  
  def update
    @user = ClientUser.find(params[:id])
    @user.update(user_params)
    redirect_to admin_client_user_path(@user)
  end

  private
  def user_params
    params.require(:client_user).permit(:family_name, :first_name, :kana_family_name, :kana_first_name, :postal_code, :address, :tel, :email, :delete_status)
  end
end
