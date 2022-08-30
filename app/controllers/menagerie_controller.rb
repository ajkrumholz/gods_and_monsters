class MenagerieController < ApplicationController
  def index
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