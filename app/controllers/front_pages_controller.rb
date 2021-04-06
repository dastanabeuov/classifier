class FrontPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :service, :help, :contact]

  skip_authorization_check

  def home
  end

  def feedback
  end

  def service
  end

  def help
  end

  def contact
  end
end
