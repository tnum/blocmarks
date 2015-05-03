class BookmarkPolicy < ApplicationPolicy
	attr_reader :user, :bookmark, :topic

  def initialize(user, bookmark)
    @user = user
    @bookmark = bookmark
  end

end