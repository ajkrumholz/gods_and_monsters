class MonstersController < ApplicationController
  def index
    @monsters = ["Monster 1", "Monster 2", "Monster 3"]
  end

  def new

  end
end