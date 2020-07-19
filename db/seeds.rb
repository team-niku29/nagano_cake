# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
​
admin_user = Admin.new(:email => 'admin@niku.com', :encrypted_password => 'nikuniku')
admin_user.save!
​
client_user = Client_user.new(:email => 'user@niku.com', :encrypted_password => 'nikuniku')
client_user.save!
​
product = Product.new(:name => 'user@niku.com', :introdution => 'nikuniku', :price_excluding => 0, :out_of_stock => '', )
product.save!
​
order = Order.new(:client_user_id => 1, :shipping_name => '', :postal_code => '0', :shipping_address => '', :total_quantity => 0, :charriage => 0, :billing_amount => 0, :status_flg => 0, :payment_flg => 0)
order.save!
​
genre = Genre.new(:name => 'user@niku.com', :invalid_status => 'false')
genre.save!
​
address = Address.new(:client_user_id => 1, :postal_code => '0',:address => 'user@niku.com', :name => 'nikuniku')
address.save!
​
cart = Cart.new(:client_user_id => 1, :product_id => 1, :quantity => 1)
cart.save!
​
order_item = Order_item.new(:orders_id => 1, :product_id => 1, :name => '', :price => 0, :quantity => 1, :production_status => 0)
order_item.save!
