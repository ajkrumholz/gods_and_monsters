class GodsController < ApplicationController
  def index
    @gods = God.all
  end

  def show
    @god = God.find(params[:id])
  end

  def new

  end

  def create
    require 'pry'; binding.pry
    god = God.new(
      {
        name: params[:god][:name],
        age: params[:god][:age],
        immortal: params[:god][:immortal]
      }
    )
    require 'pry'; binding.pry
    god.save
    require 'pry'; binding.pry
    redirect_to '/gods'
  end
end