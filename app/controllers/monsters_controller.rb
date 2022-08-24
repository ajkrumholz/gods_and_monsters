class MonstersController < ApplicationController
  def index
    @monsters = Monster.all
  end

  def new

  end

  def show
    @monster = Monster.find(params[:id])
  end
end