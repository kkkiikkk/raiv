class AddPublishedYearToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :published_year, :integer
  end
end
