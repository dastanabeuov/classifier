# frozen_string_literal: true

class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user
    if user.admin? || user.email == 'web.dev.adk@gmail.com'
      admin_abilities
    elsif user.moderator?
      moderator_abilities(user)
    elsif user.paid_user?
      paid_abilities(user)
    else
      guest_abilities
    end
  end

  def admin_abilities
    can :manage, :all
  end

  def moderator_abilities(_user)
    guest_abilities
    can %i[create update update_inline import destroy],
          [Xroot, Xcategory, Xclass, Activity, Property],
          user_id: @user.id
          # Доступ только к своим записям.
  end

  def paid_abilities(_user)
    guest_abilities
    can %i[create update update_inline import destroy],
          [Xroot, Xcategory, Xclass, Activity, Property],
          user_id: @user.id
          # Доступ только к своим записям.
  end

  def guest_abilities
    can :read, :all
  end
end
