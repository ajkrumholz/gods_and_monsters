class AddMonstersToGods < ActiveRecord::Migration[5.2]
  def change
    add_reference :monsters, :god, foreign_key: true
  end
end