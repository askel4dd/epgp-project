class GuildsController < ApplicationController
  def index
    @guilds = Guild.all
  end

  def show
    @guild = Guild.find(params[:id])
  end
end
