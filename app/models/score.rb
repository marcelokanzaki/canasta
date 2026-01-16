class Score < ApplicationRecord
  belongs_to :round
  belongs_to :player

  def total_points
    card_points - debt_points + clean_canasta_points + dirty_canasta_points + full_canasta_points + half_canasta_points + knocks_points
  end

  def clean_canasta_points
    clean_canastas * 300
  end

  def dirty_canasta_points
    dirty_canastas * 200
  end

  def full_canasta_points
    full_canastas * 1000
  end

  def half_canasta_points
    half_canastas * 500
  end

  def knocks_points
    knocks * 100
  end
end
