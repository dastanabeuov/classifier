module XclassesHelper
  def count_xclasses
    Xclass.all.count
  end

  def current_user_count_xclasses
    xclasses = []
    sum = 0
    current_user.xroots.each do |xroot|
      xroot.xcategories.each do |xcategory|
        xclasses << xcategory.xclasses.all.count
      end
    end
    xclasses.each { |a| sum += a }
    sum
  end
end
