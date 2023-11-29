class CreateRecommendations < ActiveRecord::Migration[7.1]
  def change
    create_table :recommendations do |t|
      t.references :property, null: false, foreign_key: true
      t.references :recommendable, polymorphic: true

      t.timestamps
    end
  end
end
