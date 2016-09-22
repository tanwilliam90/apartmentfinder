class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      user = User.new
    end

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :owner
      can :manage, Apartment, user_id: user.id
      can :read, Apartment
    else
      can :read, Apartment
    end
  end
end
