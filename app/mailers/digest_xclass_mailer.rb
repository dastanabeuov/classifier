class DigestXclassMailer < ApplicationMailer
  def digest(user)
    @greeting = "Hi #{user.email}"
    @xclasses = Xclass.one_day_ago
    mail(to: user.email, subject: 'Digest of xclasses') if @xclass.any?
  end
end