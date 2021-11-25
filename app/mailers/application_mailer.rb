# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'd.abeuov9@gmail.com'

  def send_welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome!')
  end
end
