class MonstersController < ApplicationController
  def index
    @monsters = Monster.all
  end

  def new
    @god = God.find(params[:id])
  end

  def show
    @monster = Monster.find(params[:id])
  end

  def create
    @god = God.find(params[:god_id])
    @monster = @god.monsters.new(
      {
        name: params[:name],
        strength_rank: params[:strength_rank],
        flying: params[:flying]
      }
    )
    if @monster.save
      redirect_to "/gods/#{@god.id}/menagerie"
    else
      redirect_to "/gods/#{@god.id}/menagerie/new"
      @errors = @monster.errors.messages
    end
  end
end