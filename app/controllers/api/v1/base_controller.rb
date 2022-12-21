# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      before_action :doorkeeper_authorize!

      skip_before_action :authenticate_user!

      authorize_resource

      respond_to :json

      private

      def current_resource_owner
        @current_resource_owner ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      end

      def current_user
        current_resource_owner
      end
    end
  end
end
