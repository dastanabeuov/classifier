Devise.setup do |config|
  config.secret_key = 'e775bbaa75cb98a7602d1ebca71a6f4accf1e0276be2d751026355a8f648f2f171f38ca776b1f5eb9622f54a07b7cd36497620596964d9257fb86c6f94ab158e'

  config.mailer_sender = 'info@classifier.kz'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 11

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete
end
