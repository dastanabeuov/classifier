module XcategoriesHelper
  def count_xcategories
    Xcategory.all.size
  end

  def current_user_count_xcategories
    current_user.xcategories.size
  end
end
