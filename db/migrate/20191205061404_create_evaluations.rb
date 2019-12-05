class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.integer :schedule_id
      t.integer :achievement_score
      t.integer :quality_score
      t.integer :time_score
      t.integer :total_point
      t.text :memo

      t.timestamps
    end
  end
end
