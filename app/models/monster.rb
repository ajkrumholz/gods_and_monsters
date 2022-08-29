class Monster < ApplicationRecord
  belongs_to :god

  def self.display_by_str(god, min_strength_rank)
    min_strength_rank = 0 if min_strength_rank.nil?
    god.monsters.where("strength_rank >= #{min_strength_rank}").order(:name)
  end
end