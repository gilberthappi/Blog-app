class RenamePostsTitle < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :Title, :title
  end
end
