class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.email == "d.abeuov9@gmail.com"
     can :manage, :all
    end
    
    if user.admin?
     can :manage, :all
    end

    if user.guest?
     can :create, :all
     can :read, :all
     can :update, :all
    end
    
    if user.moderator?
     can :create, :all
     can :read, :all
     can :destroy, :all
     can :update, :all
    end
  end
  
end
