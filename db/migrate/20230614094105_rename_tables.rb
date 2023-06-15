class RenameTables < ActiveRecord::Migration[7.0]
  def change
    rename_table :user, :users
    rename_table :post, :posts
    rename_table :comment, :comments
    rename_table :like, :likes
  end
end
