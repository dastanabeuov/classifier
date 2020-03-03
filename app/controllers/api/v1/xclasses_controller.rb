module Api
  module V1
    class XclassesController < ApplicationController
      respond_to :json

      def index
        respond_with Xclass.all
      end

      def show
        respond_with Xclass.find(params[:id])
      end

      def create
        respond_with Xclass.create(params[:xroot])
      end

      def update
        respond_with Xclass.update(params[:id], params[:xroot])
      end

      def destroy
        respond_with Xclass.destroy(params[:id])
      end
    end    
  end
end