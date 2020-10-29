module ActivitiesHelper
  def count_activities
    Activity.all.count
  end

  def activity(property)
    activity = Activity.where(id: property.activity_id)
    activity.name
  end

  def current_user_count_activities
    current_user.activities.all.count
  end
end
