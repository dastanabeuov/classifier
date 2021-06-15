class XrootsChannel < ApplicationCable::Channel
  def follow
    stream_from 'xroots'
  end
  # def echo(data)
  #   #Rails.logger.info data
  #   transmit data
  # end
end
