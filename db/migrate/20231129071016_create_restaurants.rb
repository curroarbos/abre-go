class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.string :search_name
      t.string :name
      t.string :address
      t.integer :rating
      t.integer :review_count
      t.string :telephone_number
      t.string :google_link

      t.timestamps
    end
  end
end
