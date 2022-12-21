# frozen_string_literal: true

module ActivitiesHelper
  def count_activities
    activities ||= Activity.all.size
    activities
  end

  def activity(property)
    activity = Activity.where(id: property.activity_id)
    activity.name
  end

  def current_user_count_activities
    current_user_activities ||= current_user.activities.size
    current_user_activities
  end
end
