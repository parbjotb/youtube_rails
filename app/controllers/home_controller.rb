class HomeController < ApplicationController
  def index
    @videos = Video.includes(:channel_creator).order("views DESC").limit(10)
    @channel_creators = ChannelCreator.select("channel_creators.*")
                                      .select("COUNT(channel_creators.id) as video_count")
                                      .left_joins(:videos)
                                      .group("channel_creators.id")
                                      .order("video_count DESC")
                                      .limit(10)
  end
end
