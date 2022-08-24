class MonstersController < ApplicationController
  def index
    @monsters = Monster.all
  end

  def new

  end
end