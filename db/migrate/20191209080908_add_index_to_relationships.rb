class AddIndexToRelationships < ActiveRecord::Migration[5.2]
  def change
  	add_index :relationships, :following_id, :unique => true
  end
end
