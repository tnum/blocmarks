class RemoveBookmarksFromTopics < ActiveRecord::Migration
  def change
  	remove_column :topics, :bookmark_id, :integer
  end
end
