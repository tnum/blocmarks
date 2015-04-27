class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @user = User.find_by(email: params[:sender])
    @topic = Topic.find_by(title: params[:subject])

    @url = params["body-plain"]

    @bookmark = @topic.bookmarks.create(url: @url)
    
    # puts "INCOMING PARAMS HERE: #{params}"

    # You put the message-splitting and business
    # magic here. 

    # Assuming all went well. 
    head 200
  end

end