class RemoveDayFromTimeSlots < ActiveRecord::Migration[7.1]
  def change
    remove_column :time_slots, :day, :date
    remove_column :time_slots, :start_time, :time
    remove_column :time_slots, :end_time, :time
    add_column :time_slots, :start_time, :datetime
    add_column :time_slots, :end_time, :datetime
  end
end
