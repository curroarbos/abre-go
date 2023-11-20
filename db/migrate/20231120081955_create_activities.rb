class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.integer :price
      t.string :location
      t.integer :max_people
      t.string :photo_url

      t.timestamps
    end
  end
end
