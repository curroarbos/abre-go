class AddPhototoProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :photo, :string
  end
end
