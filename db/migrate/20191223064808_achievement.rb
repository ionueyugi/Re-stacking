class Achievement < ActiveRecord::Migration[5.2]
  def change
  	drop_table :achievements
  end
end
