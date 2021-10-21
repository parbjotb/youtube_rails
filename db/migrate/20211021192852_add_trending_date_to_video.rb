class AddTrendingDateToVideo < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :trending_date, :string
  end
end
