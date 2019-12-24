class RenameScheduleTitleColumnToEvents < ActiveRecord::Migration[5.2]
  def change
  	 rename_column :events, :schedule_title, :title
  end
end
