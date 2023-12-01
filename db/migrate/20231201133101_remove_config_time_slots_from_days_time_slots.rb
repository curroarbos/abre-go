class RemoveConfigTimeSlotsFromDaysTimeSlots < ActiveRecord::Migration[7.1]
  def change
    remove_reference :days_time_slots, :config_time_slots, null: false, foreign_key: true
    add_reference :days_time_slots, :config_time_slot, foreign_key: true
  end
end
