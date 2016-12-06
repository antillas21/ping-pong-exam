class HomeController < ApplicationController
  def index
  end

  def history
    @game_history = GameHistory.build(current_user)
  end
end
