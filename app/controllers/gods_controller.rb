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
    @god.save
    if @god.save == true
      redirect_to '/gods'
    else
      redirect_to '/gods/new'
      @errors = @god.errors.messages
    end
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

  def menagerie
    @god = God.find(params[:id])
  end
end