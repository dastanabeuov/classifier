class DigestXcategoryJob < ApplicationJob
  queue_as :default

  def perform
    DigestXcategory.new.send_digest
  end
end
