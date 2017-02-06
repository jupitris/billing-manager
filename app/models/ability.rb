class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else if user.member?
      can :manage, Office
    else
      can :read, :all
    end
  end
end
