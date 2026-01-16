class Seat < ApplicationRecord
  belongs_to :match
  belongs_to :player

  validates :player_id, uniqueness: { scope: :match_id }

  def total_points
    match.scores.where(player: player).sum(&:total_points)
  end
end
