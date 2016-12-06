class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :played_on
      t.timestamps null: false
    end
  end
end
