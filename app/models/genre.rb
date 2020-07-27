class Genre < ApplicationRecord

  has_many :products, dependent: :destroy
  def self.search(search)
  end

  validates :name, presence: true, uniqueness: true
end
