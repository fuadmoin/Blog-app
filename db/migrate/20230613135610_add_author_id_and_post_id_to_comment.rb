class AddAuthorIdAndPostIdToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comment, :author, foreign_key: { to_table: :user }
    add_reference :comment, :post, foreign_key: { to_table: :post }
  end
end
