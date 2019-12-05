class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id
      t.integer :visited_id
      t.integer :post_id
      t.integer :post_comment_id
      t.integer :schedule_id
      t.string :action
      t.boolean :checked,default:false

      t.timestamps
    end
  end
end
