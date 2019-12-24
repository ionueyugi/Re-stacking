class AddDetailsToEvaluationtimes < ActiveRecord::Migration[5.2]
  def change
    add_column :evaluationtimes, :evaluation_id, :integer
  end
end
