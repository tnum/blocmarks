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

end

private

def topic_params
  params.require(:topic).permit(:title, :description)
end