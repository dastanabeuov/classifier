# frozen_string_literal: true

module XclassesHelper
  def count_xclasses
    xclasses ||= Xclass.all.size
    xclasses
  end

  def current_user_count_xclasses
    current_user_xclasses ||= current_user.xclasses.size
    current_user_xclasses
  end
end
