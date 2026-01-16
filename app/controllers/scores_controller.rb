class ScoresController < ApplicationController
  def update
    @score = Score.find(params[:id])
    @score.update(score_params)
    head :no_content
  end

  private

  def score_params
    params.require(:score).permit(
      :knocks,
      :debt_points,
      :full_canastas,
      :half_canastas,
      :clean_canastas,
      :dirty_canastas,
      :card_points
    )
  end
end
