class AddDefaultToUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :is_provider, :boolean, default: false
  end
end
