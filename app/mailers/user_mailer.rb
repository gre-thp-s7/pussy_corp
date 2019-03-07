class UserMailer < ApplicationMailer
  default from: 'no-reply@pussy_corp.com'

  def welcome_email(user)

    @user = user

    @url = "http://pussy-corp.herokuapp.com/login"

    mail(
      to: @user.email,
      subject:'Bienvenue chez Pussy Corp !'
      )

  end

  def order_comfirmation(order)

    @user = order.user
    @products = order.product_list

    @url = "http://pussy-corp.herokuapp.com/login"

    mail(
      to: @user.email,
      subject:'Merci pour votre commande!'
      )

  #Pièce jointe
  #attachments['file.jpg'] = File.read('path/to/file.jpg')
  end

  def admin_order_comfirmation(order)

    @user = User.where(admin: true)

    @url = "http://pussy-corp.herokuapp.com/login"

    mail(
      to: @user.email,
      subject:'Un client à passé une commande'
      )

  end

end
