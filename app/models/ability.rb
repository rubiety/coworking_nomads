class Ability
  include CanCan::Ability

  def initialize(current_user)
    if current_user and current_user.admin?
      can :manage, :all

    elsif current_user
      can :read, City, :active => true
      can :read, Venue, :active => true
      can :read, [User, Review, CheckIn]

      can :manage, User, :id => current_user.id

      can :create, Review
      can :update, Review, :user_id => current_user.id
      
      can :create, [CitySuggestion, VenueSuggestion]

      can :create, CheckIn
      can :destroy, CheckIn, :user_id => current_user.id
    else
      can :read, City, :active => true
      can :read, Venue, :active => true
      can :read, [User, Review, CheckIn]

      can :create, CitySuggestion

    end
  end
end
