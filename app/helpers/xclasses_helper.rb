module XclassesHelper
  def count_xclasses
    Xclass.all.size
  end

  def current_user_count_xclasses
    current_user.xclasses.size
  end
end
