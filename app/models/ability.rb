# frozen_string_literal: true

class Ability
    include CanCan::Ability

    def initialize(user)
      user ||= User.new 
      if user.esteban?
        can :manage, :all        
      else
        can :read, JobOffer
    end
  end
end



# class Ability
#   include CanCan::Ability

#   def initialize(user)
#     user ||= User.new # guest user (not logged in)

#     # Abilities for all users, including guests
#     can :read, JobOffer

#     if user.esteban?
#       # Abilities for Esteban
#       can :manage, :all
#     elsif user.normal?
#       # Abilities for normal users
#       can :create, Application
#     end
#   end
# end
