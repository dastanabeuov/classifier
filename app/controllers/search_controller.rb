class SearchController < ApplicationController
  def index
    @results = Search.execute(ThinkingSphinx::Query.escape(params[:search][:query]), 
      params[:search][:resource]) if params[:search][:query].present?
  end
end