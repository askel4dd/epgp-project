class GuildsController < ApplicationController
  def index
    @guilds = Guild.all
  end

  def show
    @guild = Guild.find(params[:id])
    #@roster = @guild.epgps.where(recorded_at: 1420825500)
    if params[:recorded_at]
      @roster = @guild.epgps.where(recorded_at: params[:recorded_at])
    else 
      @roster = @guild.epgps.where(recorded_at: @guild.list_timestamps.max)
    end
  end

  private

  def guild_params
    params.require(:guild).permit(:recorded_at)
  end
end
