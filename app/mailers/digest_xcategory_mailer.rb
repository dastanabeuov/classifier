class DigestXcategoryMailer < ApplicationMailer
  def digest(user)
    @greeting = "Hi #{user.email}"
    @xcategories = Xcategory.one_day_ago
    mail(to: user.email, subject: 'Digest of xcategories') if @xcategories.any?
  end
end