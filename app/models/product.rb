class Product < ApplicationRecord

  belongs_to :genre
  has_many :carts, dependent: :destroy
  attachment :image, destroy: false

  def self.search(search)
  return Genre.all unless search
  Genre.where([' content LIKE ?'], "%#{search}%")

end
