class CreateRewards < ActiveRecord::Migration[5.2]
  def change
    create_table :rewards do |t|
      t.integer :user_id
      t.text :reward_content

      t.timestamps
    end
  end
end
