class Product < ApplicationRecord

  belongs_to :genre
  has_many :carts, dependent: :destroy
  attachment :image, destroy: false

<<<<<<< HEAD
  def self.search(search)
  return Genre.all unless search
  Genre.where([' content LIKE ?'], "%#{search}%")
  end
=======
  validates :name, presence: true, presence: { message: "商品名が空白です"}
  validates :name, uniqueness: true
  validates :introduction,presence: true, presence: { message: "商品説明が空白です"}
  validates :price_excluding, presence: true, presence: { message: "価格が空白です"}

  def self.search(search,word)
		if search == "forward_match"
			@products = Product.where("name LIKE?","#{word}%")
		elsif search == "backward_match"
			@products = Product.where("name LIKE?","%#{word}")
		else
			@products = Product.all
		end
  end

  # def self.search(search)
  #   return Genre.all unless search
  #   Genre.where([' content LIKE ?'], "%#{search}%")
  # end
>>>>>>> 4aa912546f59ded765c1f5b81d083759bb55fad0
end
