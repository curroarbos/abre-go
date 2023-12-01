class ChangeFrequencyToStringFromConfigTimeSlots < ActiveRecord::Migration[7.1]
  def change
    change_column :config_time_slots, :frequency, :string
  end
end
