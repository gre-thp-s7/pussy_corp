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

  def order_comfirmation(user)

    @order = Order.new

    @user = User.new

    @url = "lien mort"

    # @url = LIEN DE SA PAGE PROFIL

    mail(
      to: @user.email,
      subject:'Merci pour votre commande!'
      )

    #Pièce jointe
  #  attachments['file.jpg'] = File.read('path/to/file.jpg')
  end

  def admin_order_comfirmation

    @user = user

    # @url = ADMIN PAGE

    mail(
      to: "thp.sess7.gre@gmail.com",
      subject:'Un client à passé une commande'
      )

  end

end
