class AddAuthorIdAndPostIdToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :like, :author, foreign_key: { to_table: :user }
    add_reference :like, :post, foreign_key: { to_table: :post }
  end
end
