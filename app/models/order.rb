class Order < ApplicationRecord

  belongs_to :cart

  belongs_to :user


#=================== MAILER =================
# Send an email after a user ordered a picture
  after_create :send_order_comfirmation
  after_create :send_admin_order_comfirmation

  def send_order_comfirmation

    # Tell the UserMailer to send an comfirmation email after the creation of an order
    UserMailer.order_comfirmation(self).deliver_now

  end

  def send_admin_order_comfirmation

    # Tell the UserMailer to send an comfirmation email after the creation of an order
    UserMailer.order_comfirmation(self).deliver_now

  end
#==============================================
end 