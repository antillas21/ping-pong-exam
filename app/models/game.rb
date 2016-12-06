class Game < ActiveRecord::Base
  validates :played_on, presence: true, allow_nil: false, allow_blank: false
  has_many :game_scores
  has_many :users, through: :game_scores
end
