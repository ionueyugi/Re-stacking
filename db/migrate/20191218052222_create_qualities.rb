class CreateQualities < ActiveRecord::Migration[5.2]
  def change
    create_table :qualities do |t|
      t.integer :quality_score

      t.timestamps
    end
  end
end
