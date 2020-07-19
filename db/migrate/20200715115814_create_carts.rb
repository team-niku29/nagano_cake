class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer	:client_user_id, null: false, default: 0
      t.integer	:product_id, null: false, default: 0
      t.integer	:quantity, null: false, default: 0
      t.timestamps
    end
  end
end
