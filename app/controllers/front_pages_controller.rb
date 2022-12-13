# frozen_string_literal: true

class FrontPagesController < ApplicationController
  skip_before_action :authenticate_user!
  
  def home; end

  def feedback; end

  def service; end

  def help; end

  def contact; end
end
