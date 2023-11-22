class AddCategoryReferenceToActivities < ActiveRecord::Migration[7.1]
  def change
    add_reference :activities, :category, foreign_key: true
  end
end
