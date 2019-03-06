class Order < ApplicationRecord
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




end
