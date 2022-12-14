class GodsController < ApplicationController
  def index
    if params[:sort_by_monsters]
      @gods = God.sort_by_monsters
    else
      @gods = God.all.order(created_at: :desc)
    end
  end
  
  def new
    if params[:check]
      @radio_msg = "Please make a selection"
    end
  end
  
  def create
    @god = God.new(
      {
        name: params[:name],
        age: params[:age],
        immortal: params[:immortal]
      }
    )
    if @god.save
      redirect_to '/gods'
    else
      redirect_to '/gods/new?check=1'
    end
  end
  
  def show
    @god = God.find(params[:id])
  end

  def edit
    @god = God.find(params[:id])
    if params[:check]
      @radio_msg = "Please make a selection"
    end
  end

  def update
    @god = God.find(params[:id])
    @god.update(
      {
        name: params[:name],
        age: params[:age],
        immortal: params[:immortal]
      }
    )
    if @god.save
      redirect_to "/gods/#{@god.id}"
    else
      redirect_to "/gods/#{@god.id}/edit?check=1"
    end
  end

  def destroy
    @god = God.find(params[:id])
    @god.monsters.destroy_all
    @god.destroy
    redirect_to '/gods'
  end
end