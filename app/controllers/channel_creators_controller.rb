class ChannelCreatorsController < ApplicationController
  def index
    @channel_creators = ChannelCreator.ordered_by_videos
  end

  def show
    @channel_creator = ChannelCreator.find(params[:id])
  end
end
