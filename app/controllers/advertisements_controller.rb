class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new
    @advertisement.title = params[:advertisement][:title]
    @advertisement.body = params[:advertisement][:copy]

    if @advertisement.save
      flash[:notice] = "Welcome to the fold, Mr. Draper."
      redirect_to @post
    else
      flash.now[:alert] = "Sorry Dog, that's not going to fly."
      render :new
    end
  end
end
