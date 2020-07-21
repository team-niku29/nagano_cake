class AddressesController < ApplicationController
  def index
  end

  def create
    @address = Address.new(address_params) #Bookモデルのテーブルを使用しているのでbookコントローラで保存する。
    @address.client_user_id = current_user.id
    if @address.save #入力されたデータをdbに保存する。
      redirect_to request.referer, notice: "successfully created address!"#保存された場合の移動先を指定。
    else
      redirect_to request.referer
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address ,:name)
  end

end
