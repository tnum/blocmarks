class RemoveTopicFromBookmarks < ActiveRecord::Migration
  def change
    remove_column :bookmarks, :topic_id, :integer
  end
end
