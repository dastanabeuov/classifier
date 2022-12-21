class SearchController < ApplicationController
  skip_authorization_check
  
  def index
    @results = Search.execute(ThinkingSphinx::Query.escape(params[:search][:query]), 
      params[:search][:resource]) if params[:search][:query].present?
  end
end