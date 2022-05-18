# frozen_string_literal: true

class User < ApplicationRecord
  enum role: { guest: 0, moderator: 1, paid_user: 2, admin: 3 } # , _suffix: :role

  has_many :xroots, dependent: :destroy
  has_many :xcategories, dependent: :destroy
  has_many :xclasses, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :authorizations, dependent: :destroy

  validates :email, exclusion: { in: %w[admin@classifier.kazniisa.kz
                                        moderator@classifier.kazniisa.kz
                                        paid_user@classifier.kazniisa.kz
                                        guest@classifier.kazniisa.kz],
                                 message: '%{value} has already been taken.' }

  validates :password, length: { in: 6..20 }

  after_create :send_admin_mail

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :omniauthable, omniauth_providers: [:github]

  def self.find_for_oauth(auth)
    FindForOauth.new(auth).call
  end

  def create_authorization(auth)
    authorizations.create(provider: auth.provider, uid: auth.uid)
  end

  def send_admin_mail
    UserMailer.send_welcome_email(self).deliver_later
  end

  def author_of?(resource)
    resource.user_id == id
  end
end
