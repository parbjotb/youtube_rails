class Video < ApplicationRecord
  belongs_to :channel_creator
  validates :title, :views, :description, presence: true
  validates :description, uniqueness: true
  validates :views, numericality: {only_integer: true}
end
