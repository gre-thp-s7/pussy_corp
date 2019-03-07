# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def welcome_email

    UserMailer.welcome_email(User.last)

  end

  def order_comfirmation

    UserMailer.order_comfirmation(User.last)

  end

  def admin_order_comfirmation

    UserMailer.admin_order_comfirmation(User.last)

  end

end
