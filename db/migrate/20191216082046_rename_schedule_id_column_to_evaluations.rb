class RenameScheduleIdColumnToEvaluations < ActiveRecord::Migration[5.2]
  def change
  	rename_column :evaluations, :schedule_id, :event_id
  end
end
