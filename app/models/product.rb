class Product < ApplicationRecord

	validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
  validates :image_url, presence: true, uniqueness: true




end
