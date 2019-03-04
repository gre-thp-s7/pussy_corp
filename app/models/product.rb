class Product < ApplicationRecord

  has_many :carts

	validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
  validates :image_url, presence: true, uniqueness: true

end



# un item pourra être ajouté dans plusieurs carts
