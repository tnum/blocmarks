class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    puts "INCOMING PARAMS HERE: #{params}"

    @user = User.find_by(email: params[:sender])

    if @user.present?
      @topic = @user.find_or_create_by(title: params[:subject], user_id: @user)
      # @topic = @user.topics.find_or_create_by(title: params[:subject], user_id: @user)
      # @url = params["body-plain"]
    end
    

    # if @user.present?
    #  @bookmark = Bookmark.build(topic: @topic, url: @url)
    # end

    head 200
  end

end