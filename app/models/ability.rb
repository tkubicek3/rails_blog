class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :user
      can :create, Post
      can [:update, :destroy], Post do |post|
        post.user_id == user.id
      end
      can :read, :all
    else
      can :read, :all
    end
  end
end