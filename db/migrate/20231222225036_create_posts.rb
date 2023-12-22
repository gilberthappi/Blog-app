class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :author_id
      t.integer :comments_counter
      t.integer :likes_counter

      t.timestamps
    end
  end
end
