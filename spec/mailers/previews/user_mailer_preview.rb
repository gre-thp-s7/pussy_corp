# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def send_email_after_inscription
    UserMailer.send_email_after_inscription()
  end
  
end
