class BookmarksController < ApplicationController

	def show
		@bookmark = Bookmark.find(params[:id])
		@topic = Topic.find(params[:topic_id])
	end

	def new
		@topic = Topic.find(params[:topic_id])
		@bookmark = Bookmark.new
	end

	def create
		@topic = Topic.find(params[:topic_id])
		@bookmark = Bookmark.create(bookmark_params)
		@bookmark.topic = @topic

		if @bookmark.save
			flash[:notice] = "Your bookmark has been saved successfully"
			redirect_to topic_path(@topic.id)
		else
			flash[:error] = "There was an error, please try again"
			render :new
		end
	end

end

private

def bookmark_params
	params.require(:bookmark).permit(:url)
end