class Ability
  include CanCan::Ability

  def initialize(current_user)
    if current_user and current_user.admin?
      can :manage, :all
    else
      can :read, :all
      can :manage, User do |user|
        user == current_user
      end

      can :create, CitySuggestion
      cannot :read, CitySuggestion
    end
  end
end
