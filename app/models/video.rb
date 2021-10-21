class Video < ApplicationRecord
  belongs_to :channel_creator
  validates :title, :views, presence: true
  #validates :description, uniqueness: true
  #validates :views, numericality: {only_integer: true}
end
