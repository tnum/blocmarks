class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    puts "INCOMING PARAMS HERE: #{params}"

    @user = User.find_by(email: params[:sender])

    if @user.present?
      @topic = Topic.find_or_create_by(user_id: @user.id, title: params[:subject])
      @topic.save
      @url = params["body-plain"]
      @bookmark = Bookmark.create(topic: @topic, url: @url)
      @bookmark.save
      #@topic = Topic.new(user_id: @user.id, title: params[:subject])
      # @topic = @user.topics.find_or_create_by(title: params[:subject], user_id: @user)
      # @url = params["body-plain"]
    end
    

    # if @user.present?
    #  @bookmark = Bookmark.build(topic: @topic, url: @url)
    # end

    head 200
  end

end