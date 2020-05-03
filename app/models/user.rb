class User < ApplicationRecord
  has_many :xroots, dependent: :destroy  
  
  after_create :send_admin_mail
  
  devise :database_authenticatable,
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable,
         :confirmable


  def send_admin_mail
    UserMailer.send_welcome_email(self).deliver_later
  end
end
