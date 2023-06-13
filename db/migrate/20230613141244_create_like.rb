class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :like, &:timestamps
  end
end
