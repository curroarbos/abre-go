class AddOwnerToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :is_owner, :boolean, default: false
  end
end
