class Product < ApplicationRecord

<<<<<<< HEAD
	validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
  has_one_attached :picture
=======
has_one_attached :picture
# before_save :grab_image

# def grab_image
#   downloaded_image = (open('https://loremflickr.com/g/400/400/cat/'))
#   self.pussy.attach(io: downloaded_image, filename: 'image.png')
# end
>>>>>>> 3c78eb928e3e20814518c03d46e56dc0c0cf5228

has_many :cart_products
has_many :carts, through: :cart_products


<<<<<<< HEAD
=======
	validates :title, presence: true, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
>>>>>>> 3c78eb928e3e20814518c03d46e56dc0c0cf5228

### these lines will permit yaya to test aws with active storrage ####
# before_save :grab_image

# def grab_image
#   downloaded_image = (open('https://loremflickr.com/g/400/400/cat/'))
#   self.pussy.attach(io: downloaded_image, filename: 'image.png')
# end
##################################################


end
