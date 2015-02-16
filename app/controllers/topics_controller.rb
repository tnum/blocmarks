class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

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
  end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update_attributes(topic_params)
      redirect_to root_path
    else
      flash[:error] = "Error updating, please try again"
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "Successfully deleted"
      redirect_to root_path
    else
      flash[:error] = "There was an error, please try again"
      render :edit
    end
  end

end

private

def topic_params
  params.require(:topic).permit(:title, :description)
end