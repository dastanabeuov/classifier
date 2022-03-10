# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'classifier@kazniisa.kz'
  layout 'mailer'
end
