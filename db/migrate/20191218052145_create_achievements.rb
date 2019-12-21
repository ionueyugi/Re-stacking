class CreateAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :achievements do |t|
      t.integer :achievement_score

      t.timestamps
    end
  end
end
