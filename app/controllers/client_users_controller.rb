class ClientUsersController < ApplicationController
  def show
    @client_users = ClientUser.find(params[:id])
    if @client_users.id != current_client_user.id
      redirect_to "/client_users/#{current_client_user.id}"
    end
  end

  def edit
  end

  def update
  end

  def withdrawal
  end

  def withdrawal_update
  end
  
end
