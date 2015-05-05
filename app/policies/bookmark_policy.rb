class BookmarkPolicy < ApplicationPolicy
	attr_reader :user, :bookmark

  def initialize(user, bookmark)
    @user = user
    @bookmark = bookmark
  end

  def update?
    user.present? && @bookmark.topic.user == user
  end

  def destroy?
    update?
  end

end
