module Services
  class DigestXcategory
    def send_digest
      User.find_each(batch_size: 500) do |user|
        DigestXcategoryMailer.digest(user).deliver_later
      end
    end
  end
end