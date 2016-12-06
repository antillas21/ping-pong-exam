require "rails_helper"

RSpec.describe GamePresenter do
  it "expects a Game instance as argument" do
    expect { described_class.new }.to raise_error(ArgumentError)
  end

  it "expects a User instance as argument" do
    expect { described_class.new(Game.new) }.to raise_error(ArgumentError)
  end

  describe "an instance" do
    describe "#opponent" do
      it "retrieves the opposing user" do
        setup(21, 16)
        game = described_class.new(@game, @player)
        expect(game.opponent).to eq(@opponent)
      end
    end

    describe "#score" do
      it "represents overall score (player score first)" do
        setup(21, 16)
        game = described_class.new(@game, @player)
        expect(game.score).to eq("21-16")
      end
    end

    describe "#result" do
      it "returns W for wins" do
        setup(21, 16)
        game = described_class.new(@game, @player)
        expect(game.result).to eq("W")
      end

      it "returns L for losses" do
        setup(16, 21)
        game = described_class.new(@game, @player)
        expect(game.result).to eq("L")
      end
    end
  end

  private

  def setup(own_score, opponent_score)
    @player = create(:user, email: "player@example.com")
    @opponent = create(:user, email: "opponent@example.com")
    @game = create(:game, played_on: Date.current)
    @player.scores.create(score: own_score, game: @game)
    @opponent.scores.create(score: opponent_score, game: @game)
  end
end
