module XcategoriesHelper
  def count_xcategories
    Xcategory.all.count
  end

  def current_user_count_xcategories
    xcategories = []
    sum = 0
    current_user.xroots.each do |xroot|
      xcategories << xroot.xcategories.all.count
    end
    xcategories.each { |a| sum += a }
    sum
  end

  def count_xclasses_for_xcategory(xclass)
    items = []
    xclass.children.each do |child|
      items << child
    end
    items.count
  end

  def count_xclasses_root_in_xcategory(xcategory)
    xclasses = []
    xcategory.xclasses.each do |xclass|
      if xclass.root?
        xclasses << xclass
      end
    end
    xclasses.count
  end
end
