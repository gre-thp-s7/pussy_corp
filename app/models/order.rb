class Order < ApplicationRecord

  belongs_to :cart



  #=================== MAILER =================
# Send an email after a user ordered a picture
  after_create :order_comfirmation_send

  def order_comfirmation_send

    # Tell the UserMailer to send an comfirmation email after the creation of an order
    UserMailer.order_comfirmation(self).deliver_now

  end
#=============================================
end
