module XrootsHelper
  def count_xroots
    Xroot.all.size
  end

  def current_user_count_xroots
    current_user.xroots.size
  end
end
