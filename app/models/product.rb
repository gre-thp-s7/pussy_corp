class Product < ApplicationRecord

	validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
  has_one_attached :picture

  has_many :carts
  has_many :orders, through: :carts



## these lines will permit yaya to test aws with active storrage ####
# before_save :grab_image

# def grab_image
#   downloaded_image = (open('https://loremflickr.com/g/400/400/cat/'))
#   self.picture.attach(io: downloaded_image, filename: 'image.png')
# end
#################################################


end
