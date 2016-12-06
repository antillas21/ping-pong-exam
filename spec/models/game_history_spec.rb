require "rails_helper"

RSpec.describe GameHistory do
  describe ".build" do
    it "expects a user as argument" do
      expect { described_class.build }.to raise_error(ArgumentError)
    end
  end

  describe "#records" do
    it "retrieves a Game presenter for each game played" do
      setup
      game_history = described_class.build(@player)
      expect(game_history.records.first).to be_a GamePresenter
    end
  end

  def setup
    @player = create(:user, email: "player_a@example.com")
    @opponent = create(:user, email: "player_b@example.com")
    game = create(:game, played_on: Date.current)
    @player.scores.create(score: 21, game: game)
    @opponent.scores.create(score: 18, game: game)
  end
end
