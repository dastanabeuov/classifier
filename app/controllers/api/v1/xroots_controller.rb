# frozen_string_literal: true

module Api
  module V1
    class XrootsController < Api::V1::BaseController
      before_action :set_xroot, only: %i[show update destroy]

      def index
        @xroots = Xroot.all
        respond_with @xroots, each_serializer: XrootSerializer
      end

      def show
        respond_with @xroot, serializer: XrootSerializer
      end

      def create
        @xroot = Xroot.create(xroot_params)
        respond_with @xroot, serializer: XrootSerializer
      end

      def update
        @xroot.update(xroot_params) if current_resource_owner.author_of?(@xroot)
        respond_with @xroot, serializer: XrootSerializer
      end

      def destroy
        @xroot.destroy if current_resource_owner.author_of?(@xroot)
        respond_with @xroot, serializer: XrootSerializer
      end

      private

      def set_xroot
        @xroot ||= Xroot.find(params[:id])
      end

      def xroot_params
        params.require(:xroot).permit(:title, :description,
                                      :synonym, :code, :version_date, :publish,
                                      properties_attributes: %i[id title activity_id _destroy])
                                      .merge(user: current_resource_owner)
      end
    end
  end
end
