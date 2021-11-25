# frozen_string_literal: true

module XcategoriesHelper
  def count_xcategories
    xcategories ||= Xcategory.all.size
    xcategories
  end

  def current_user_count_xcategories
    current_user_xcategories ||= current_user.xcategories.size
    current_user_xcategories
  end
end
