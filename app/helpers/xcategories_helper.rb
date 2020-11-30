module XcategoriesHelper
  def count_xcategories
    Xcategory.all.size
  end

  def current_user_count_xcategories
    xcategories = []
    
    current_user.xroots.each do |xroot|
      xcategories << xroot.xcategories.all.count
    end
    xcategories.size
  end
end
