class Order < ApplicationRecord
  belongs_to :client_user
  has_many :order_items, dependent: :destroy

  enum status_flg: { "入金待ち": 0, "入金確認": 1, "制作中": 2, "発送準備中": 3, "発送済み": 4}
  enum payment_flg: { "銀行振込": 0, "クレジットカード": 1}
end
