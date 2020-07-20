class Cart < ApplicationRecord
  belongs_to :client_user
  belongs_to :product
end
