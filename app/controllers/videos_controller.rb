class VideosController < ApplicationController
  def index
    # now videos will be passed to the index view
    @videos = Video.includes(:channel_creator).all
  end

  def show
    @video = Video.find(params[:id])
    @base_url = "https://www.youtube.com/watch?v="
    # @videoID = Video.video_id
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @videos = Video.where("title LIKE ?", wildcard_search)
  end
end
