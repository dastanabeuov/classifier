class FrontPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :service, :help, :contact]

  def home
  end

  def service
  end

  def help
  end

  def contact
  end
end
