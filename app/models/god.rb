class God < ApplicationRecord
  validates :name, :age, :immortal, presence: true
  validates :name, uniqueness: true
  has_many :monsters
end