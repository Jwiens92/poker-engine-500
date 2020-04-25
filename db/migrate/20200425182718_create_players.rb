class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :uuid
      t.string :username
      t.timestamps
    end

    add_index :players, :uuid
    add_index :players, :username, unique: true
  end
end
