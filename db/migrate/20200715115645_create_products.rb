class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer	:genre_id, null: false, default: 0
      t.string	:name, null: false, default: ""
      t.text	:introduction, null: false, default: ""
      t.integer	:price_excluding, null: false, default: 0
      t.string	:image_id
      t.boolean	:out_of_stock, null: false, default: false
      t.timestamps
    end
    add_index :products, :name
  end
end
