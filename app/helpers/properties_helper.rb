module PropertiesHelper
  def count_properties
    Property.all.size
  end

  def current_user_count_properties
    properties = []
    current_user.activities.each do |activity|
      properties << activity.properties.all.count
    end
    properties.size
  end
end
