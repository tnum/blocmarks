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
		@bookmark = Bookmark.create(bookmark_params)
		@bookmark.topic = @topic
		authorize @bookmark

		if @bookmark.save
			flash[:notice] = "Your bookmark has been saved successfully"
			redirect_to topic_path(@topic.id)
		else
			flash[:error] = "There was an error, please try again"
			render :new
		end
	end

	def edit
		@bookmark = Bookmark.find(params[:id])
	  @topic = Topic.find(params[:topic_id])
	  authorize @bookmark
	end

	def destroy
    @bookmark = Bookmark.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "Successfully deleted"
      redirect_to topic_path
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