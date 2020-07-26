class Genre < ApplicationRecord

  has_many :products, dependent: :destroy
  def self.search(search)
  end
end
