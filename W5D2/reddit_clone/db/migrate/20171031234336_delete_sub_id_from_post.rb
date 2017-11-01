class DeleteSubIdFromPost < ActiveRecord::Migration[5.1]
  def up
    remove_column :posts, :sub_id
  end

  def down
    add_column :posts, :sub_id, :integer, null: false
    add_index :sub_id
  end
end
