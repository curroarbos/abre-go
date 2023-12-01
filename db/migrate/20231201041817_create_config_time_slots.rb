class CreateConfigTimeSlots < ActiveRecord::Migration[7.1]
  def change
    create_table :config_time_slots do |t|
      t.integer :frequency
      t.float :duration
      t.references :activities, null: false, foreign_key: true

      t.timestamps
    end
  end
end
