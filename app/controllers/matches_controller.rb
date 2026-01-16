class MatchesController < ApplicationController
  def index
    @matches = Match.all.order(created_at: :desc)
  end

  def new
    @match = Match.new
    6.times { @match.seats.build }
  end

  def create
    @match = Match.new(match_params)

    if @match.save
      redirect_to @match
    else
      render :new
    end
  end

  def show
    @match = Match.find(params[:id])
    @leaderboard = @match.seats.sort_by { |seat| -seat.total_points }
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    redirect_to root_path
  end

  private

  def match_params
    params.require(:match).permit(seats_attributes: %i(id player_id _destroy))
  end
end
