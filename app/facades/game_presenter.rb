class GamePresenter
  def initialize(game, player)
    @game = game
    @player = player
  end

  def opponent
    @opponent ||= get_opponent
  end

  def score
    [player_score.score, opponent_score.score].join("-")
  end

  def result
    return "W" if player_score.score > opponent_score.score
    "L"
  end

  def date
    game.played_on.strftime("%b %d, %Y")
  end

  private

  attr_reader :player, :game, :player_score, :opponent_score

  def get_opponent
    game.game_scores.where.not(user_id: player).first.user
  end

  def player_score
    @player_score ||= game.game_scores.find_by(user_id: player.id)
  end

  def opponent_score
    @opponent_score ||= game.game_scores.find_by("user_id != ?", player.id)
  end
end
