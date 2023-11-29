class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :location
      t.text :embedded_link
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
