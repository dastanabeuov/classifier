class DigestXcategoryMailer < ApplicationMailer
  def digest(user)
    @greeting = "Hi #{user.email}"
    @xcategories = Xcategory.1.minute.ago
    mail(to: user.email, subject: 'Digest of xcategories') if @xcategories.any?
  end
end
