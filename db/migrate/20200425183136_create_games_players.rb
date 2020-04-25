class CreateGamesPlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :games_players do |t|
      t.bigint :game_id, null: false, index: true
      t.bigint :player_id, null: false, index: true
      t.timestamps
    end

    add_index :games_players, [:game_id, :player_id], unique: true

    add_foreign_key :games_players, :games
    add_foreign_key :games_players, :players
  end
end
