class Product < ApplicationRecord



has_many :cart_products
has_many :carts, through: :cart_products
has_one_attached :picture



## these lines will permit yaya to test aws with active storrage ####
# before_save :grab_image

# def grab_image
#   downloaded_image = (open('https://loremflickr.com/g/400/400/cat/'))
#   self.picture.attach(io: downloaded_image, filename: 'image.png')
# end
#################################################


end
