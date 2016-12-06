class GamesController < ApplicationController
  def new
    @form = GameForm.build(current_user)
  end

  def create
    @form = GameForm.build(current_user)
    if @form.save(game_params)
      redirect_to history_path, notice: "Game successfully added"
    else
      flash[:error] = @form.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def sanitize_params(game_params)
    game_date = Date.new(
      game_params["played_on(1i)"].to_i,
      game_params["played_on(2i)"].to_i,
      game_params["played_on(3i)"].to_i
    )
    game_params.deep_merge(game: { played_on: game_date}).except(
      "played_on(1i)",
      "played_on(2i)",
      "played_on(3i)"
    )
  end

  def game_params
    params.require(:game_form).permit(
      :score,
      game: [:played_on],
      opponent: [:score, :user_id],
    )
  end
end
