module PropertiesHelper
  def count_properties
    Property.all.count
  end

  def current_user_count_properties
    #current_user.properties.all.count
  end
end
