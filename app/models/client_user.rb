class ClientUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :carts, dependent: :destroy

  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :tel, presence: true
  validates :email, presence: true
  validates :delete_status, presence: true
  validates :kana_first_name, presence: true,
                 format: {
                   with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
                   message: "全角カタカナのみで入力して下さい"
                 }
  validates :kana_family_name, presence: true,
  format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
}

def self.search(search,word)
  if search == "forward_match"
    @users = ClientUser.where("family_name LIKE?","#{word}%")
  elsif search == "backward_match"
    @users = ClientUser.where("first_name LIKE?","%#{word}")
  else
    @users = ClientUser.all
  end
end

end
