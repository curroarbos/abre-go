class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :photo_url, :text
    add_column :users, :is_provider, :boolean
  end
end
