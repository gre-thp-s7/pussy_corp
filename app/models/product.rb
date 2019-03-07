class Product < ApplicationRecord

require 'open-uri'

has_many :cart_products
has_many :carts, through: :cart_products
has_one_attached :picture



## these lines will permit yaya to test aws with active storrage ####
# before_save :grab_image

# def grab_image
# 	downloaded_image1 = (open('https://picsum.photos/400/400/?random'))
#   downloaded_image = (open('https://loremflickr.com/g/400/400/cat/'))
# #  binding.pry
#   self.picture.attach(io: open(downloaded_image), filename: self.name)
# end
################################################


end
