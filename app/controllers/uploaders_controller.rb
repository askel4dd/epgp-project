class UploadersController < ApplicationController
  before_action :authenticate_user!

  def new
    @uploader = EpgpParser.new
  end

  def create
    @uploader = EpgpParser.new(parser_params)
    if @uploader.valid? && @uploader.guild_owner(current_user)
      @uploader.save(current_user)
      render :show
    else
      render :new
    end
  end
  
  private

  def parser_params
    params.require(:epgp_parser).permit(:source, :guild)
  end

end
