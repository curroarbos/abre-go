class RemoveActivitiesFromConfigTimeSlots < ActiveRecord::Migration[7.1]
  def change
    remove_reference :config_time_slots, :activities, null: false, foreign_key: true
    add_reference :config_time_slots, :activity, foreign_key: true
  end
end
