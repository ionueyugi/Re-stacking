class RemoveAuthorFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :day, :date
    remove_column :events, :start_time, :integer
    remove_column :events, :finish_time, :integer
  end
end
