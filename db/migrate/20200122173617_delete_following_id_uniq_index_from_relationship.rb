class DeleteFollowingIdUniqIndexFromRelationship < ActiveRecord::Migration[5.2]
  def change
    remove_index :relationships, :following_id
    add_index :relationships, :following_id
  end
end
