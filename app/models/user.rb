class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart

	validates :first_name, presence: true
  validates :last_name, presence: true

# ho, tout l'email en minuscule ;-)
  before_save { self.email = email.downcase }

# magie noire pour le format de l'email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
    presence: true,
    length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }



#################### MAILER futur pour test ################

  # after_create :welcome_send

  # def welcome_send
  #   UserMailer.welcome_email(self).deliver_now
  # end


###############################################

end
