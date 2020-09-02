module ActivitiesHelper
  def count_activities
    Activity.all.count
  end
end
