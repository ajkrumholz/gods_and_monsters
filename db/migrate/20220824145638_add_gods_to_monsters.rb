class AddGodsToMonsters < ActiveRecord::Migration[5.2]
  def change
    add_reference :monsters, :gods, foreign_key: true
  end
end
