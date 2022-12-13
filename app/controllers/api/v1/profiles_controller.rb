# frozen_string_literal: true

module Api
  module V1
    class ProfilesController < Api::V1::BaseController
      def index
        respond_with :api, :v1, other_resource_owners
      end

      def me
        respond_with :api, :v1, current_user
      end

      protected

      def other_resource_owners
        @other_resource_owners ||= User.where.not(id: current_user.id) if doorkeeper_token
      end
    end
  end
end
