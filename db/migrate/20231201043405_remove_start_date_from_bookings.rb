class RemoveStartDateFromBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :start_date, :datetime
    remove_column :bookings, :end_date, :datetime
    add_reference :bookings, :time_slot, foreign_key: true
  end
end
