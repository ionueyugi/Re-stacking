class CreateEvaluationtimes < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluationtimes do |t|
      t.integer :time_score

      t.timestamps
    end
  end
end
