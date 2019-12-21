class RemoveAuthorFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :finish_at, :time
  end
end
