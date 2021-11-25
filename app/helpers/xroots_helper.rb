# frozen_string_literal: true

module XrootsHelper
  def count_xroots
    xroots ||= Xroot.all.size
    xroots
  end

  def current_user_count_xroots
    current_user_xroots ||= current_user.xroots.size
  end
end
