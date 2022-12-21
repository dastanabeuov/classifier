class DigestXcategoryJob < ApplicationJob
  queue_as :default

  def perform
    Services::DigestXcategory.new.send_digest
  end
end
