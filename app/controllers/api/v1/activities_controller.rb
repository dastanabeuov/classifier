# frozen_string_literal: true

module Api
  module V1
    class ActivitiesController < Api::V1::BaseController
      before_action :set_activity, only: %i[show update destroy]

      def index
        @activities = Activity.all
        respond_with @activities, each_serializer: ActivitySerializer
      end

      def show
        respond_with @activity, serializer: ActivitySerializer
      end

      def create
        @activity = Activity.create(activity_params)
        respond_with @activity, serializer: ActivitySerializer
      end

      def update
        @activity.update(activity_params) if current_resource_owner.author_of?(@activity)
        respond_with @activity, serializer: ActivitySerializer
      end

      def destroy
        @activity.destroy if current_resource_owner.author_of?(@activity)
        respond_with @activity, serializer: ActivitySerializer
      end

      private

      def set_activity
        @activity ||= Activity.find(params[:id])
      end

      def activity_params
        params.require(:activity).permit(:title, :description,
                                         :synonym, :code, :version_date,
                                         :publish, :position, :parent_id,
                                         properties_attributes: %i[id title activity_id _destroy])
                                         .merge(user: current_resource_owner)
      end
    end
  end
end
