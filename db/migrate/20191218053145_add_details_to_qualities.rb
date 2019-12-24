class AddDetailsToQualities < ActiveRecord::Migration[5.2]
  def change
    add_column :qualities, :evaluation_id, :integer
  end
end
