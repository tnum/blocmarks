class LikesController < ApplicationController
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    @topic = @bookmark.topic
    like = current_user.likes.build(bookmark: @bookmark)
    
    if like.save
      flash[:notice] = "You have liked the bookmark"
      redirect_to @topic
    else
      flash[:error] = "There was an error, please try again"
    end
  end

  def destroy
    # Get the bookmark from the params
    @bookmark = Bookmark.find(params[:bookmark_id])
    @topic = @bookmark.topic
    # Find the current user's like with the ID in the params
    @like = current_user.likes.where(bookmark_id: @bookmark.id).first

    if @like.destroy
      # Flash success and redirect to @bookmark
      flash[:notice] = "Bookmark unliked"
      redirect_to @topic
    else
      # Flash error and redirect to @bookmark
      flash[:error] = "There was an error, please try again"
    end
  end
end