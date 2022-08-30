class God < ApplicationRecord
  # validates :name, :age, presence: true
  # validates :name, uniqueness: true
  has_many :monsters

  def self.sort_by_monsters
    @gods = God.all
    @gods.sort_by { |god| god.monsters.count }.reverse
  end
end