class Monster < ApplicationRecord
  validates :name, :strength_rank, presence: true
  validates :flying, inclusion: { in: [true, false] }
  belongs_to :god

  def self.display_by_str(god, min_strength_rank)
    min_strength_rank = 0 if min_strength_rank.nil?
    god.monsters.where("strength_rank >= #{min_strength_rank}")
  end
end