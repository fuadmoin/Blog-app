class AddAuthorIdToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :post, :author, foreign_key: { to_table: :user }
  end
end
