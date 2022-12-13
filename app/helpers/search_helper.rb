module SearchHelper
  def render_result(object)
    klass = object.class.to_s
    case klass
      when "Xclass" then render 'search/xclass', xclass: object
      when "Property" then render 'search/propertyable', property: object
      when "Activity" then render 'search/activity', activity: object
      when "User" then render 'search/user', user: object
    end
  end
end