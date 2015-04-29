class BookmarkPolicy < ApplicationPolicy
	attr_reader :user, :bookmark

  def initialize(user, bookmark)
    @user = user
    @bookmark = bookmark
  end

  def update?
    user.present? && @bookmark.user == user
  end

end