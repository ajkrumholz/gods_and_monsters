class GodsController < ApplicationController
  def index
    @gods = God.all.order(created_at: :desc)
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
    @god.monsters.delete_all
    @god.delete
    redirect_to '/gods'
  end

  def menagerie
    @god = God.find(params[:id])
    @monsters = @god.monsters.order(:name)
  end
end