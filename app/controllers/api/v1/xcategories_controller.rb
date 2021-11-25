# frozen_string_literal: true

module Api
  module V1
    class XcategoriesController < Api::V1::BaseController
      before_action :set_xroot, only: [:create]
      before_action :set_xcategory, only: %i[show update destroy]

      def show
        respond_with @xcategory, serializer: XcategorySerializer
      end

      def create
        @xcategory = @xroot.xcategories.create(xcategory_params.merge(user: current_resource_owner))
        respond_with @xroot, @xcategory, serializer: XcategorySerializer
      end

      def update
        @xcategory.update(xcategory_params) if current_resource_owner.author_of?(@xcategory)
        respond_with @xcategory, serializer: XcategorySerializer
      end

      def destroy
        @xcategory.destroy if current_resource_owner.author_of?(@xcategory)
        respond_with @xcategory, serializer: XcategorySerializer
      end

      private

      def set_xroot
        @xroot ||= Xroot.find(params[:xroot_id])
      end

      def set_xcategory
        @xcategory ||= Xcategory.find(params[:id])
      end

      def xcategory_params
        params.require(:xcategory).permit(:title, :description,
                                          :synonym, :code, :version_date, :publish,
                                          properties_attributes: %i[id title activity_id _destroy])
      end
    end
  end
end
