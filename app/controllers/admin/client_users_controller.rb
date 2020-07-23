class Admin::ClientUsersController < ApplicationController
  def index
  end

  def show
    @user = ClientUser.find(params[:id])
  end

  def edit
  end
  
  def update
  end
end
