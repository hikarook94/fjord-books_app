class RenameFollowedIdColumnToFollows < ActiveRecord::Migration[6.1]
  def change
    rename_column :follows, :followed_id, :followee_id
  end
end
