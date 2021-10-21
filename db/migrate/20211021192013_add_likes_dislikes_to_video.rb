class AddLikesDislikesToVideo < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :likes, :bigint
    add_column :videos, :dislikes, :bigint
  end
end
