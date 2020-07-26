class ClientUsersController < ApplicationController
  def show
    @client_users = ClientUser.find(params[:id])
    if @client_users.id != current_client_user.id
      redirect_to "/client_users/#{current_client_user.id}"
    end
  end

  def edit
    @client_user = current_client_user
  end

  def update
    @client_user = current_client_user
    if @client_user.update(client_user_params)
      redirect_to @client_user, notice: "会員情報を更新しました!"
    else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
      render "show"
    end
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

  def client_user_params
    params.require(:client_user).permit(:family_name,:first_name, :kana_family_name, :kana_first_name, :email, :postal_code, :address, :tel)
  end

end
