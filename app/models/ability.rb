class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user
    if user
      user.admin? ? admin_abilities : user_abilities(user)
    else
      guest_abilities
    end
  end

  def guest_abilities
    can :read, :all
  end

  def admin_abilities
    can :manage, :all
  end

  def user_abilities(user)
    guest_abilities
    can :create, [Xroot, Xcategory, Xclass, Activity, Property]
    can [:update, :destroy], [Xroot, Xcategory, Xclass, Activity, Property], user_id: @user.id
  end
end
