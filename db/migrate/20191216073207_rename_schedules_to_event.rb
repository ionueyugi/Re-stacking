class RenameSchedulesToEvent < ActiveRecord::Migration[5.2]
  def change
  	 rename_table :schedules, :events
  end
end
