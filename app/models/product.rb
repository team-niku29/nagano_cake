class Product < ApplicationRecord

  belongs_to :genre
  has_many :carts, dependent: :destroy
  attachment :image, destroy: false

  validates :name, presence: true, presence: { message: "商品名が空白です"}
  validates :name, uniqueness: true
  validates :introduction,presence: true, presence: { message: "商品説明が空白です"}
  validates :price_excluding, presence: true, presence: { message: "価格が空白です"}
  

  # def self.search(search)
  #   return Genre.all unless search
  #   Genre.where([' content LIKE ?'], "%#{search}%")
  # end
end
