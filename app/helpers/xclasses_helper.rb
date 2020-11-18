module XclassesHelper
  def count_xclasses
    Xclass.all.size
  end

  def current_user_count_xclasses
    xclasses = []
    current_user.xroots.each do |xroot|
      xroot.xcategories.each do |xcategory|
        xclasses << xcategory.xclasses.all.count
      end
    end
    xclasses.size
  end
end
