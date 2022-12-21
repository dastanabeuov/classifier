# frozen_string_literal: true

module Api
  module V1
    class ProfilesController < Api::V1::BaseController
      def index
        respond_with other_resource_owners
      end

      def me
        respond_with current_resource_owner
      end

      protected

      def other_resource_owners
        @other_resource_owners ||= User.where.not(id: current_resource_owner.id) if doorkeeper_token
      end
    end
  end
end
