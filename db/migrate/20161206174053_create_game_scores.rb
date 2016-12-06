class CreateGameScores < ActiveRecord::Migration
  def change
    create_table :game_scores do |t|
      t.integer :game_id, null: false
      t.integer :user_id, null: false
      t.integer :score, null: false
      t.timestamps null: false
    end

    add_index :game_scores, :game_id
    add_index :game_scores, :user_id
  end
end
