class Order < ApplicationRecord
  belongs_to :users, optional: true
  has_many :carts
  has_many :products, through: :carts
end
