class ChangeDayToArrayFromDayTimeSlots < ActiveRecord::Migration[7.1]
  def change
    remove_column :days_time_slots, :day, :string
    add_column :days_time_slots, :day, :string, array: true, default: []
  end
end
