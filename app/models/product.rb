class Product < ApplicationRecord

has_one_attached :picture
# before_save :grab_image

# def grab_image
#   downloaded_image = (open('https://loremflickr.com/g/400/400/cat/'))
#   self.pussy.attach(io: downloaded_image, filename: 'image.png')
# end

has_many :cart_products
has_many :carts, through: :cart_products


	validates :title, presence: true, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true

end



# un item pourra être ajouté dans plusieurs carts
