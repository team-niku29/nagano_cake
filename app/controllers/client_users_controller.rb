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
    @client_user = current_client_user
  end

  def withdrawal_update
    @client_user = ClientUser.find(params[:client_user_id])
    @client_user.delete_status = true
    @client_user.save
    redirect_to destroy_client_user_session_path
  end

  private

  #def client_user
   # params.require(:client_user).permit(:client_user_id)
  #end
end
