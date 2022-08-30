class GodsController < ApplicationController
  def index
    if params[:sort_by_monsters]
      @gods = God.sort_by_monsters
    else
      @gods = God.all.order(created_at: :desc)
    end
  end
  
  def new
    
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
    # else
    #   redirect_to '/gods/new'
    #   @errors = @god.errors.messages
    end
  end
  
  def show
    @god = God.find(params[:id])
  end

  def edit
    @god = God.find(params[:id])
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
    # else
    #   redirect_to "/gods/#{@god.id}/edit"
    #   @errors = @god.errors.messages
    end
  end

  def destroy
    @god = God.find(params[:id])
    @god.monsters.destroy_all
    @god.destroy
    redirect_to '/gods'
  end

  def menagerie
    @god = God.find(params[:id])
    @min_strength_rank = params[:min_strength_rank]
    if params[:sort_alpha] == "1"
      @monsters = @god.monsters.order(:name)
    else
      @monsters = @god.monsters
    end
    @monsters = @monsters.display_by_str(@god, @min_strength_rank)
  end
end