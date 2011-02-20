class Ability
  include CanCan::Ability

  def initialize(current_user)
    if current_user.admin?
      can :manage, :all
    else
      can :read, :all
      can :manage, User do |user|
        user == current_user
      end
    end
  end
end
