class CreateDaysTimeSlots < ActiveRecord::Migration[7.1]
  def change
    create_table :days_time_slots do |t|
      t.string :day
      t.time :start_time
      t.time :end_time
      t.references :config_time_slots, null: false, foreign_key: true

      t.timestamps
    end
  end
end
