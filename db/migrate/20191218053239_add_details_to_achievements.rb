class AddDetailsToAchievements < ActiveRecord::Migration[5.2]
  def change
    add_column :achievements, :evaluation_id, :integer
  end
end
