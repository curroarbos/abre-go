class ChangeReferencesFromTimeSlots < ActiveRecord::Migration[7.1]
  def change
    change_column_default :time_slots, :booked, false
    remove_reference :time_slots, :activities, index: true, foreign_key: true
    add_reference :time_slots, :activity, foreign_key: true
  end
end
