class Match < ApplicationRecord
  has_many :seats, dependent: :destroy
  has_many :players, through: :seats
  has_many :rounds, dependent: :destroy
  has_many :scores, through: :rounds
  accepts_nested_attributes_for :seats, reject_if: :all_blank, allow_destroy: true
end
