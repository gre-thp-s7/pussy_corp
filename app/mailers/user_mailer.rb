class UserMailer < ApplicationMailer
  default from: 'no-reply@pussy_corp.com'
  
  def welcome_email(user)
    @user = user
    @url = "http://pussy-corp.herokuapp.com/login"
    mail(
      to: @user.email,
      subject:'Bienvenue chez Pussy Corp !')
  end

end