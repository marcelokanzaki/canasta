class Round < ApplicationRecord
  belongs_to :match
  has_many :scores, dependent: :destroy

  after_create :create_scores

  def ordinal
    match.rounds.where("created_at <= ?", created_at).count
  end

  private

  def create_scores
    match.seats.each { |seat| scores.create(player: seat.player) }
  end
end
