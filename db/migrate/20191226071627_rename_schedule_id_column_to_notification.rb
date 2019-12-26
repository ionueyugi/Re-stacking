class RenameScheduleIdColumnToNotification < ActiveRecord::Migration[5.2]
  def change
  	rename_column :notifications, :schedule_id, :event_id
  end
end
