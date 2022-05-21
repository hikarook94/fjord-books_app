class RenameFollowingIdColumnToFollows < ActiveRecord::Migration[6.1]
  def change
    rename_column :follows, :following_id, :followed_id
  end
end
