class WalksController < ApplicationController
  def new
    @site = Site.find(params["site_id"])
    @walk = Walk.new
    authorize @walk
  end

  def create
    walk = Walk.new(walk_params)
    authorize walk
    walk.site = Site.find(params["site_id"])
    # raise
    if walk.save
      redirect_to site_path(Site.find(params["site_id"]))
    else
      render :new
    end
  end

  private

  def walk_params
    params.require(:walk).permit(:name, :description, :length, :duration, :coords, :photo)
  end
end
