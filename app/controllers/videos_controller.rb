class VideosController < ApplicationController
  def index
    # now videos will be passed to the index view
    @videos = Video.includes(:channel_creator).all
  end

  def show
    @video = Video.find(params[:id])
  end
end
