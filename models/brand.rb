class Brand < ActiveRecord::Base
  has_many :products
  has_many :categories, through: :products
end
