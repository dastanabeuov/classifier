class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    #can :manage, :all
    if user.email == "d.abeuov9@gmail.com"
     can :manage, :all
    elsif user.admin?
     can :manage, :all
    elsif user.guest?
     can :create, :all
     can :read, :all
     can :access, :rails_admin
     can :read, :dashboard
    else
     can :read, :all
    end
  end
end
