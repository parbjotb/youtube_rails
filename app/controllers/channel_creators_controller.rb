class ChannelCreatorsController < ApplicationController
  def index
    @channel_creators = ChannelCreator.select("channel_creators.*")
                                      .select("COUNT(channel_creators.id) as video_count")
                                      .left_joins(:videos)
                                      .group("channel_creators.id")
                                      .order("video_count DESC")
  end

  def show
    @channel_creator = ChannelCreator.find(params[:id])
  end
end
