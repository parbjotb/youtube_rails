class HomeController < ApplicationController
  def index
    @videos = Video.includes(:channel_creator).order("views DESC").limit(10)
    # @channel_creators =
  end
end
