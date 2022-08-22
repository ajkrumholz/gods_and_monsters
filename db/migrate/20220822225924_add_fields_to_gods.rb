class AddFieldsToGods < ActiveRecord::Migration[5.2]
  def change
    add_column :gods, :created_at, :datetime
    add_column :gods, :updated_at, :datetime
  end
end
