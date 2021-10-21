class ChannelCreator < ApplicationRecord
  has_many :videos
  validates :name, presence: true

  def self.ordered_by_videos
    self.select("channel_creators.*")
        .select("COUNT(channel_creators.id) as video_count")
        .left_joins(:videos)
        .group("channel_creators.id")
        .order("video_count DESC")
  end
end
