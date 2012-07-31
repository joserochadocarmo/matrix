class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all

    if user.admin?
    	can :manage, :all
    else
    	cannot [:update, :destroy, :create,:index], User
    	cannot [:destroy], Project
    	#cannot [:update, :destroy], User, :email => 'username@example.com'
    end
  end
end
