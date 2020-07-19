class Product < ApplicationRecord
  belongs_to :cart
  has_many :genres, dependent: :destroy
end
