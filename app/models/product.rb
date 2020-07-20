class Product < ApplicationRecord
  belongs_to :genre
  has_many :carts, dependent: :destroy
end
