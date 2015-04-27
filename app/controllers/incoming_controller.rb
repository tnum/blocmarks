class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    puts "INCOMING PARAMS HERE: #{params}"

    #@user = User.find_by(email: params[:sender])

    @user = User.first
    @url = params["body-plain"]

    if @user.present?
      @topic = @user.topics.find_or_create_by(title: params[:subject], user: @user)
      @bookmark = Bookmark.new(topic: @topic, url: @url)
    end

    render :nothing => true

    head 200
  end

end