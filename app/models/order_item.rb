class OrderItem < ApplicationRecord
  belongs_to :order

  enum production_status: { "製作待ち": 0, "制作中": 1, "製作完了": 2, "着手不可": 3}
end
