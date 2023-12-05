class RemoveEndDateFromDaysTimeSlots < ActiveRecord::Migration[7.1]
  def change
    remove_column :days_time_slots, :end_time, :time
    add_column :days_time_slots, :frequency, :integer

    remove_column :config_time_slots, :duration, :float

    add_column :activities, :duration, :float
  end
end
