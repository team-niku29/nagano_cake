class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :client_user_id,null: false,default: 0
      t.string :shipping_name,null: false,default: ""
      t.string :postal_code,null: false,default: ""
      t.string :shipping_address,null: false,default: ""
      t.integer :total_quantity,null: false,default: 0
      t.integer :charriage,null: false,default: 800
      t.integer :billing_amount,null: false,default: 0
      t.integer :status_flg,null: false, default: 0
      t.integer :payment_flg, null: false, default: 0
      t.timestamps
    end
    add_index :orders, :client_user_id
  end
end
