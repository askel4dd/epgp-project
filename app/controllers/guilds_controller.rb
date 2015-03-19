class GuildsController < ApplicationController
  def index
    @guilds = Guild.all
  end

  def show
    @guild = Guild.find(params[:id])
    @roster = @guild.roster_on_timestamp(params[:recorded_at])
  end

  private

  def guild_params
    params.require(:guild).permit(:recorded_at)
  end
end
