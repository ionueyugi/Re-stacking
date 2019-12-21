class RenameFinishTimeColumnToEvents < ActiveRecord::Migration[5.2]
  def change
  	rename_column :events, :finish_time, :finish_at
  end
end
