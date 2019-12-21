class AddDetailsToEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_column :evaluations, :achievement_targetvalue_score, :integer
    add_column :evaluations, :quality_targetvalue_score, :integer
    add_column :evaluations, :time_targetvalue_score, :integer
  end
end
