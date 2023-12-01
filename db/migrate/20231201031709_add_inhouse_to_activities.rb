class AddInhouseToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :in_house, :boolean
  end
end
