class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :client_user_id,null: false, default: 0
      t.string :postal_code,null: false, default: ""
      t.string :address,null: false, default: ""
      t.string :name,null: false, default: ""
      t.timestamps
    end
    add_index :addresses, :client_user_id
  end
end
