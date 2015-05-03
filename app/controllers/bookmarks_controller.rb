class BookmarksController < ApplicationController

	def show
		@bookmark = Bookmark.find(params[:id])
		@topic = Topic.find(params[:topic_id])
	end

	def new
		@topic = Topic.find(params[:topic_id])
		@bookmark = Bookmark.new
		authorize @bookmark
	end

	def create
		@topic = Topic.find(params[:topic_id])
		@bookmark = current_user.bookmarks.new(bookmark_params)
		authorize @bookmark

		if @bookmark.save
			flash[:notice] = "Your bookmark has been saved successfully"
			redirect_to topic_path(@topic)
		else
			flash[:error] = "There was an error, please try again"
			render :new
		end

	end

	def edit
		@bookmark = Bookmark.find(params[:id])
	  @topic = Topic.find(params[:topic_id])
	  authorize @topic
	end

  def update
    @bookmark = Bookmark.find(params[:id])
    @topic = Topic.find(params[:topic_id])
		@user = @bookmark.user
		authorize @topic

    if @bookmark.update_attributes(bookmark_params)
      flash[:notice] = "Your bookmark has been sucessfully updated"
      redirect_to topic_path(@topic)
    else
      flash[:error] = "Error updating, please try again"
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    authorize @topic

    if @bookmark.destroy
      flash[:notice] = "Successfully deleted"
      redirect_to @topic
    else
      flash[:error] = "There was an error, please try again"
      render :edit
    end
  end

	private

	def bookmark_params
		params.require(:bookmark).permit(:url, :title)
	end

end