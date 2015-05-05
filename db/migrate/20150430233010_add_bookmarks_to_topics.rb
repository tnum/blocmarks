class AddBookmarksToTopics < ActiveRecord::Migration
  def change
  	add_column :topics, :bookmark_id, :integer
  	add_index :topics, :bookmark_id
  end
end
