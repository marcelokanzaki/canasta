class Matches::RoundsController < ApplicationController
  def index
    @match = Match.find(params[:match_id])
    @rounds = @match.rounds.order(created_at: :desc)
  end

  def create
    @match = Match.find(params[:match_id])
    @round = @match.rounds.create

    if @round.save
      redirect_to match_round_path(@match, @round)
    else
      render :index
    end
  end

  def show
    @match = Match.find(params[:match_id])
    @round = @match.rounds.find(params[:id])
    @scores_by_player = @round.scores.includes(:player).index_by(&:player)

    @metrics = [
      [:knocks, "Batidas"],
      [:debt_points, "Mão"],
      [:full_canastas, "1000"],
      [:half_canastas, "500"],
      [:clean_canastas, "Limpas"],
      [:dirty_canastas, "Sujas"],
      [:card_points, "Pontos"]
    ]
  end

  def destroy
    @match = Match.find(params[:match_id])
    @round = @match.rounds.find(params[:id])
    @round.destroy

    redirect_to match_rounds_path(@match)
  end
end
