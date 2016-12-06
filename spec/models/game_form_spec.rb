require "rails_helper"

RSpec.describe GameForm do
  describe ".build" do
    it "expects params to build form" do
      expect { described_class.build }.to raise_error(ArgumentError)
    end

    it "builds a Game set for a given user" do
      setup
      form = described_class.build(@player_a)
      expect(form.owner).to eq(@player_a)
    end

    it "gets a (possible) opponents list" do
      setup
      form = described_class.build(@player_a)
      expect(form.opponents_list).to_not include(@player_a)
      expect(form.opponents_list).to match_array([@player_b, @player_c])
    end
  end

  describe "#save" do
    context "valid params" do
      it "returns true" do
        setup
        form = described_class.build(@player_a)
        opponent = { user_id: @player_b.id, score: 17 }
        game_params = form_params(Date.current, 21, opponent)
        expect(form.save(game_params)).to be true
      end

      it "persists Game" do
        setup
        form = described_class.build(@player_a)
        opponent = { user_id: @player_b.id, score: 17 }
        game_params = form_params(Date.current, 21, opponent)
        expect { form.save(game_params) }.to change { Game.count }.by(1)
      end

      it "persists GameScores" do
        setup
        form = described_class.build(@player_a)
        opponent = { user_id: @player_b.id, score: 17 }
        game_params = form_params(Date.current, 21, opponent)
        expect { form.save(game_params) }.to change { GameScore.count }.by(2)
      end
    end

    context "invalid params" do
      it "returns false" do
        setup
        form = described_class.build(@player_a)
        opponent = { user_id: @player_b.id, score: 17 }
        game_params = form_params(nil, 21, opponent)
        expect(form.save(game_params)).to be false
      end

      it "does not persist to database" do
        setup
        form = described_class.build(@player_a)
        opponent = { user_id: @player_b.id, score: 17 }
        game_params = form_params(nil, 21, opponent)
        expect { form.save(game_params) }.to change { Game.count }.by(0)
        expect { form.save(game_params) }.to change { GameScore.count }.by(0)
      end

      it "reports errors" do
        setup
        form = described_class.build(@player_a)
        opponent = { user_id: @player_b.id, score: 17 }
        game_params = form_params(nil, 21, opponent)
        form.save(game_params)
        expect(form.errors).to_not be_empty
      end
    end
  end

  def setup
    @player_a = create(:user, email: "player-a@example.com")
    @player_b = create(:user, email: "player-b@example.com")
    @player_c = create(:user, email: "player-c@example.com")
  end

  def form_params(date, score, opponent = {})
    {
      game: { played_on: date },
      opponent: opponent,
      score: score
    }
  end
end
