class Order < ApplicationRecord
<<<<<<< HEAD
  belongs_to :users, optional: true
  has_many :carts
  has_many :products, through: :carts

  #=================== MAILER =================
# Send an email after a user ordered a picture
after_create :order_comfirmation_send

def order_comfirmation_send
  
  # Tell the UserMailer to send an comfirmation email after the creation of an order
  UserMailer.order_comfirmation(self).deliver_now

end
#=============================================




=======
  belongs_to :cart
>>>>>>> 3c78eb928e3e20814518c03d46e56dc0c0cf5228
end
