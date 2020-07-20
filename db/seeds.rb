# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email:'admins@niku.com',password:'nikuniku')
ClientUser.create!(first_name: '堀北', family_name: 'かすみ', kana_first_name: 'ホリキタ', kana_family_name: 'カスミ', postal_code: '2222222', address: '神奈川県！', password: 'nikuniku29',tel: '90000000000', email: 'niku@juu', delete_status: true)
Genre.create!(name: 'ケーキ', invalid_status: true)
Product.create!(genre_id: 1, name: '肉肉ケーキ', introduction: '肉汁たっぷりのケーキです！', price_excluding: 3, out_of_stock: true)
Order.create!(client_user_id: 1, shipping_name: '肉29', postal_code: '1111111', shipping_address: '東京都', total_quantity: 50, charriage: 5000, billing_amount: 3000, status_flg: 2, payment_flg: 1)
Address.create!(client_user_id: 1, postal_code:'2929292', address:'niku29', name:'肉肉')
Cart.create!(client_user_id: 1, product_id: 1, quantity: 10)
OrderItem.create!(order_id: 1, product_id: 1, name: '肉けーき', price: 4000, quantity: 100, production_status: 1)