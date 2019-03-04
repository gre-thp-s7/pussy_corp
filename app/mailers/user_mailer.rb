class UserMailer < ApplicationMailer
  
  def send_email_after_inscription

    mail(to: 'contact@test.fr', subject:'Sujet de test')
  end
end
