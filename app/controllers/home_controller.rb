class HomeController < ApplicationController
  def index
    @videos = Video.includes(:channel_creator).order("views DESC").limit(10)
    @channel_creators = ChannelCreator.ordered_by_videos.limit(10)
  end
end
