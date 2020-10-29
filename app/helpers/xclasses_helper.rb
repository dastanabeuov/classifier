module XclassesHelper
  def count_xclasses
    Xclass.all.count
  end

  def current_user_count_xclasses
    current_user.xclasses.all.count
  end
end
