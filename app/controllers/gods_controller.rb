class GodsController < ApplicationController
  def index
    @gods = God.all
  end
  
  def new
    
  end
  
  def create
    god = God.new(
      {
        name: params[:god][:name],
        age: params[:god][:age],
        immortal: params[:god][:immortal],
      }
    )
    god.save
    redirect_to '/gods'
  end
  
  def show
    @god = God.find(params[:id])
  end

  def edit
    @god = God.find(params[:id])
  end

  def update
    god = God.find(params[:id])
    god.update(
      {
        name: params[:god][:name],
        age: params[:god][:age],
        immortal: params[:god][:immortal],
        created_at: Date.today
      }
    )
    god.save
    redirect_to "/gods/#{god.id}"
  end

  def destroy
    God.destroy(params[:id])
    redirect_to '/gods'
  end
end