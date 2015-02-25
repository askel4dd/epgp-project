class UploadersController < ApplicationController
  def new
    @uploader = EpgpParser.new
  end

  def create
    @uploader = EpgpParser.new(parser_params)
    if @uploader.valid?
      @uploader.save
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
