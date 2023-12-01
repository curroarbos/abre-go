class CreateTimeSlots < ActiveRecord::Migration[7.1]
  def change
    create_table :time_slots do |t|
      t.date :day
      t.time :start_time
      t.time :end_time
      t.boolean :booked
      t.references :activities, null: false, foreign_key: true

      t.timestamps
    end
  end
end
