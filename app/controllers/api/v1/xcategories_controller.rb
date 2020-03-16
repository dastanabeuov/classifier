module Api
  module V1
    class XcategoriesController < ApplicationController
      respond_to :json

      def index
        respond_with Xcategory.all
      end

      def show
        respond_with Xcategory.find(params[:id])
      end

      def create
        respond_with Xcategory.create(params[:xroot])
      end

      def update
        respond_with Xcategory.update(params[:id], params[:xroot])
      end

      def destroy
        respond_with Xcategory.destroy(params[:id])
      end
    end    
  end
end