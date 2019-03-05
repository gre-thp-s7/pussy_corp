class Product < ApplicationRecord

has_one_attached :pussy
before_save :grab_image

def grab_image
  downloaded_image = (open('https://loremflickr.com/g/400/400/cat/'))
  self.pussy.attach(io: downloaded_image, filename: 'image.png')
end

  has_many :carts
  has_many :orders, through: :carts


	validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
  validates :image_url, presence: true, uniqueness: true

end



# un item pourra être ajouté dans plusieurs carts
