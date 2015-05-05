class AddTopicToBookmarks < ActiveRecord::Migration
  def change
  	add_column :bookmarks, :topic_id, :integer
  end
end
