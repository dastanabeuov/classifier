# frozen_string_literal: true

module Api
  module V1
    class XclassesController < Api::V1::BaseController
      before_action :set_xcategory, only: [:create]
      before_action :set_xclass, only: %i[show update destroy]

      def show
        respond_with @xclass, serializer: XclassSerializer
      end

      def create
        @xclass = @xcategory.xclasses.create(xclass_params.merge(user: current_resource_owner))
        respond_with @xcategory.xroot, @xcategory, @xclass, serializer: XclassSerializer
      end

      def update
        @xclass.update(xclass_params) if current_resource_owner.author_of?(@xclass)
        respond_with @xclass, serializer: XclassSerializer
      end

      def destroy
        @xclass.destroy if current_resource_owner.author_of?(@xclass)
        respond_with @xclass, serializer: XclassSerializer
      end

      private

      def set_xcategory
        @xcategory ||= Xcategory.find(params[:xcategory_id])
      end

      def set_xclass
        @xclass ||= Xclass.find(params[:id])
      end

      def xclass_params
        params.require(:xclass).permit(:title, :description,
                                       :synonym, :code, :version_date, :publish, :xtype,
                                       :position, :parent_id,
                                       properties_attributes: %i[id title activity_id _destroy])
      end
    end
  end
end
