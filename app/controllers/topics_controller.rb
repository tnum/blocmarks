class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def create
    @topic = current_user.topics.new(topic_params)
    authorize @topic

    if @topic.save
      flash[:notice] = "Topic saved"
      redirect_to root_path
    else
      flash[:error] = "Try again"
      redirect_to new_wiki_path
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic

    if @topic.update_attributes(topic_params)
      redirect_to root_path
    else
      flash[:error] = "Error updating, please try again"
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    authorize @topic

    if @topic.destroy
      flash[:notice] = "Successfully deleted"
      redirect_to root_path
    else
      flash[:error] = "There was an error, please try again"
      render :edit
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :description)
  end

end