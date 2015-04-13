class TopicPolicy < ApplicationPolicy
  attr_reader :user, :topic

  def initialize(user, topic)
    @user = user
    @topic = topic
  end

  def update?
    user.present? && @topic.user == user
  end

  def destroy?
    update?
  end

end