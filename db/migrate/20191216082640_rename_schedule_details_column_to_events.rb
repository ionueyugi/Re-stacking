class RenameScheduleDetailsColumnToEvents < ActiveRecord::Migration[5.2]
  def change
  	rename_column :events, :schedule_details, :body
  end
end
