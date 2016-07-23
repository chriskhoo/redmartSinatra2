require './models/user'
require './models/product'
require './models/brand'
require './models/category'
require 'faker'

(1..20).each do |i|
  User.create(
  name: Faker::Name.name,
  email: Faker::Internet.email,
  address: Faker::Address.street_address,
  password: Faker::Internet.password,
  cc_number: Faker::Business.credit_card_number
  )
end

(1..100).each do |i|
  Product.create(
  name: Faker::Commerce.product_name,
  brand_id: rand(19)+1,
  category_id: rand(19)+1,
  price: Faker::Commerce.price
  )
end

(1..20).each do |i|
  Brand.create(
  name: Faker::Company.name
  )
end

(1..20).each do |i|
  Category.create(
  name: Faker::Commerce.department,
  description: Faker::Lorem.sentence
  )
end
