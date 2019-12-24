class RenameStartAtColumnToEvents < ActiveRecord::Migration[5.2]
  def change
  	rename_column :events, :start_at, :start
  end
end
