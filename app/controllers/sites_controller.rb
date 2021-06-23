class SitesController < ApplicationController
  def index
    @sites = policy_scope(Site).order(created_at: :desc)
    @markers = @sites.geocoded.map do |site|
      {
        lat: site.lat,
        lng: site.long
      }
    end
  end

  def show
    @site = Site.find(params[:id])
    authorize @site
  end
end
