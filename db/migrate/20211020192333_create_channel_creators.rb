class CreateChannelCreators < ActiveRecord::Migration[6.1]
  def change
    create_table :channel_creators do |t|
      t.string :name

      t.timestamps
    end
  end
end
