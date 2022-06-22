class Condition < ApplicationRecord
  belongs_to :end_user
  has_many :meals, through: :healths
  enum movement: { stone: 0, hard: 1, banana: 2, soft: 3, water: 4 }
  enum feel: { sad: 0, nomal: 1, happy: 2 }

  validates :movement, presence: true
  validates :feel, presence: true


end
