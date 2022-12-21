# frozen_string_literal: true

class XcategoriesChannel < ApplicationCable::Channel
  def follow
    stream_from 'xcategories'
  end
  # def echo(data)
  #   #Rails.logger.info data
  #   transmit data
  # end
end
