class ChannelCreator < ApplicationRecord
  validates :name, presence: true
end
