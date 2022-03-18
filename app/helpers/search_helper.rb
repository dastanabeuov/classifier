module SearchHelper
  def render_result(object)
    klass = object.class.to_s
    case klass
      when "Xroot" then render 'search/xroot', xroot: object
      when "Xcategory" then render 'search/xcategory', xcategory: object
      when "Xclass" then render 'search/xclass', xclass: object
      when "Property" then render 'search/propertyable', property: object
      when "Activity" then render 'search/activity', activity: object
    end
  end
end