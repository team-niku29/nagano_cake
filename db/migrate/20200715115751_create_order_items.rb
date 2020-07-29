class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change

    create_table :order_items do |t|
      t.integer	:orders_id , null: false
      t.integer	:product_id, null: false, default: 0
      t.string	:name, null: false, default: ""
      t.integer	:price, null: false, default: 0
      t.integer	:quantity, null: false, default: 0
      t.integer	:production_status, null: false, default: 0
      t.timestamps
    end
  end
end
