class AddressesController < ApplicationController
  def index
    @address = Address.new
    @client_user = current_client_user
    @addresses = @client_user.addresses.reverse_order
  end

  def create
    @address = Address.new(address_params) #addressモデルのテーブルを使用しているのでaddressコントローラで保存
    @address.client_user_id = current_client_user.id
    if @address.save #入力されたデータをdbに保存する。
      redirect_to request.referer, notice: "successfully created address!"#保存された場合の移動先を指定。
    else
      redirect_to request.referer
    end
  end

  def edit
    @client_user = current_client_user
    @address = Address.find(params[:id])
    #binding.pry
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to client_user_addresses_path(current_client_user)
    else
      render 'edit'
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to client_user_addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address ,:name)
  end

end
