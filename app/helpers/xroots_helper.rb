module XrootsHelper
  def count_xroots
    Xroot.all.count
  end

  def current_user_count_xroots
    current_user.xroots.all.count
  end
end
