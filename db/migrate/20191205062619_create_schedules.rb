class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :user_id
      t.integer :evaluation_id
      t.date :day
      t.text :schedule_title
      t.time :start_time
      t.time :finish_time
      t.text :schedule_details

      t.timestamps
    end
  end
end
