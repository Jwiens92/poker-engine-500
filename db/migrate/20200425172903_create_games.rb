class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name, null: false, default: ""
      t.string :uuid, null: false

      t.timestamps
    end

    add_index :games, :uuid
  end
end
