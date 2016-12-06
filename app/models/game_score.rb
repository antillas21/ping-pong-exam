class GameScore < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  validates :score, :game_id, :user_id, presence: true
end
