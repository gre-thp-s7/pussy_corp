class Order < ApplicationRecord
  has_many :carts
  has_many :users, through: :carts
  has_many :products, through: :carts
end
