class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    can :read, :all

    can :manage, [Resource, Project, Collaboration, Job, Picture] do |item|
        # find if the book creator (user) is the same as the currently logged in user
        item.try(:user) == user
    end


  end
end
