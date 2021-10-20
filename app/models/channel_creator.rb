class ChannelCreator < ApplicationRecord
  has_many :videos
  validates :name, presence: true
end
