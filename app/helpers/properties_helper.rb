module PropertiesHelper
  def count_properties
    Property.all.count
  end

  def current_user_count_properties
    properties = []
    sum = 0
    current_user.activities.each do |activity|
      properties << activity.properties.all.count
    end
    properties.each { |a| sum += a }
    sum
  end
end
