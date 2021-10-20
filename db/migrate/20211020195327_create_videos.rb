class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.bigint :views
      t.references :channel_creator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
