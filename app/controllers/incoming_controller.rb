class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create

    user = User.find_by(email: params[:sender])

    if user.present?
      topic = Topic.find_or_create_by(user: user, title: params[:subject])
      url = params["body-plain"]
      bookmark = Bookmark.create(topic: topic, url: url)
    end

    head :ok
  end

end