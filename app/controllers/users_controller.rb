class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user_bookmarks = @user.bookmarks.find(params[:id])

    @likes = Like.where(user_id: current_user.id)
    # @liked_bookmark = Like.joins(:bookmarks).where(id: bookmark_id)
    @liked_bookmark = Bookmark.includes(:likes)
  end

end