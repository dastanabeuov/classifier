class User < ApplicationRecord
  has_many :xroots, dependent: :destroy  
  has_many :xcategories, dependent: :destroy
  has_many :xclasses, dependent: :destroy
  has_many :properties, dependent: :destroy
  has_many :activities, dependent: :destroy  

  validates :email, exclusion: { in: %w(admin@classifier.kazniisa.kz 
                                        moderator@classifier.kazniisa.kz 
                                        paid_user@classifier.kazniisa.kz
                                        guest@classifier.kazniisa.kz), 
                                        message: "%{value} has already been taken." }

  validates :password, length: { in: 6..20 }

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

  def author_of?(resource)
    resource.user_id == id
  end
end
