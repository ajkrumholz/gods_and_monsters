class CreateGod < ActiveRecord::Migration[5.2]
  def change
    create_table :gods do |t|
      t.string :name
      t.integer :age
      t.boolean :immortal

      t.timestamps
    end
  end
end
