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
  # def self.search(search)
  #   return Genre.all unless search
  #   Genre.where([' content LIKE ?'], "%#{search}%")
  # end
>>>>>>> 97db072cf96180532e915abea46b7b46892fb3b4
end
