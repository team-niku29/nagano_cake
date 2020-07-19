class Order < ApplicationRecord
  belongs_to :client_user
  has_many :order_items, dependent: :destroy
end
