module Api
  module V1
    class XrootsController < ApplicationController
      respond_to :json

      def index
        respond_with Xroot.all
      end

      def show
        respond_with Xroot.find(params[:id])
      end

      def create
        respond_with Xroot.create(params[:xroot])
      end

      def update
        respond_with Xroot.update(params[:id], params[:xroot])
      end

      def destroy
        respond_with Xroot.destroy(params[:id])
      end
    end    
  end
end