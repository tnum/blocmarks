class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    puts "INCOMING PARAMS HERE: #{params}"

    @user = User.find_by(email: params[:sender])

    if @user.present?
      @topic = @user.topics.find_or_create_by(title: params[:subject])
      @url = params["body-plain"]
      @bookmark = Bookmark.create(url: @url)
    end

    # @topic.bookmarks.create(url: @url)

    # You put the message-splitting and business
    # magic here. 

    # Assuming all went well. 
    head 200
  end

end