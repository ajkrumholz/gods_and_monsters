class MonstersController < ApplicationController
  def index
    @monsters = Monster.all
  end

  def new
    @god = God.find(params[:id])
    if params[:check]
      @radio_msg = "Please make a selection"
    end
  end

  def show
    @monster = Monster.find(params[:id])
  end

  def create
    @god = God.find(params[:god_id])
    @monster = @god.monsters.create(
      {
        name: params[:name],
        strength_rank: params[:strength_rank],
        flying: params[:flying]
      }
    )
    if @monster.save
      redirect_to "/gods/#{@god.id}/menagerie"
    else
      redirect_to "/gods/#{@god.id}/menagerie/new?check=1"
    end
  end

  def edit
    @monster = Monster.find(params[:id])
    if params[:check]
      @radio_msg = "Please make a selection"
    end
  end

  def update
    monster = Monster.find(params[:id])
    monster.update(
      {
        name: params[:name],
        strength_rank: params[:strength_rank],
        flying: params[:flying]
      }
    )
    if monster.save
      redirect_to "/monsters/#{monster.id}"
    else
      redirect_to "/monsters/#{monster.id}/edit?check=1"
    end
  end

  def destroy
    @monster = Monster.find(params[:id])
    @monster.destroy
    redirect_to "/monsters"
  end
end