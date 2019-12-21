class RenameStartTimeColumnToEvents < ActiveRecord::Migration[5.2]
  def change
  	rename_column :events, :start_time, :start_at
  end
end
