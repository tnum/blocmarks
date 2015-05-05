class RemoveUserFromBookmarks < ActiveRecord::Migration
  def change
    remove_column :bookmarks, :user_id, :integer
  end
end
