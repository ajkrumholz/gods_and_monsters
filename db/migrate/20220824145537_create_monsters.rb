class CreateMonsters < ActiveRecord::Migration[5.2]
  def change
    create_table :monsters do |t|
      t.string :name
      t.float :strength_rank
      t.boolean :flying

      t.timestamps
    end
  end
end
