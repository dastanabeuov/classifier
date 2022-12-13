class DigestXclassJob < ApplicationJob
  queue_as :default

  def perform
    DigestXclass.new.send_digest
  end
end
