class AddIntervalToDaysTimeSlots < ActiveRecord::Migration[7.1]
  def change
    add_column :days_time_slots, :interval, :integer
  end
end
