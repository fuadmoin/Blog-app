class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :post do |t|
      t.string :title
      t.string :text
      t.integer :comments_counter
      t.integer :likes_counter

      t.timestamps
    end
  end
end
