class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user
    if user.admin?
      admin_abilities
    elsif user.moderator?
      moderator_abilities(user)
    elsif user.paid_user? || user.email == 'guest@example.com'
      paid_abilities(user)
    else
      guest_abilities
    end
  end

  def admin_abilities
    can :manage, :all
  end

  def moderator_abilities(user)
    can :manage, :all
  end

  def paid_abilities(user)
    guest_abilities
    can :create, [Xroot, Xcategory, Xclass, Activity, Property]
    can [:update, :update_inline, :destroy], [Xroot, Xcategory, Xclass, Activity, Property], user_id: @user.id
  end

  def guest_abilities
    can :read, :all
  end
end
