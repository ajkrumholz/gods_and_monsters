class God < ApplicationRecord
  validates :name, :age, presence: true
  validates :immortal, inclusion: { in: [true, false] }
  has_many :monsters

  def self.sort_by_monsters
    @gods = God.all
    @gods.sort_by { |god| god.monsters.count }.reverse
  end
end