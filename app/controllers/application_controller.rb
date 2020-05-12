class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  around_action :switch_locale

  #before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end