class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.personal_escolar?
      can :update, User, id: user.id
    end
  end
end
