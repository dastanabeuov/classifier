module XcategoriesHelper
  def count_xcategories
    Xcategory.all.count
  end

  def current_user_count_xcategories
    current_user.xcategories.all.count
  end
end
