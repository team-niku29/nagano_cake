class Cart < ApplicationRecord
  belongs_to :client_user
  has_many :products
end
