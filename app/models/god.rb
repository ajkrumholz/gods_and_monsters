class God < ApplicationRecord
  # validates :name, :age, presence: true
  # validates :name, uniqueness: true
  has_many :monsters
end