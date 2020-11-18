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

  def count_xclasses_for_xcategory(xclass)
    items = []
    xclass.children.each do |child|
      items << child
    end
    items.size
  end

  def count_xclasses_root_in_xcategory(xcategory)
    xclasses = []
    xcategory.xclasses.each do |xclass|
      if xclass.root?
        xclasses << xclass
      end
    end
    xclasses.size
  end
end
