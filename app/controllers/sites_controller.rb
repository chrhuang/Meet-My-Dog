class SitesController < ApplicationController
  def index
    @sites = policy_scope(Site).order(created_at: :desc)
    @markers = @sites.geocoded.map do |site|
      {
        lat: site.lat,
        lng: site.long,
        info_window: render_to_string(partial: "site_window", locals: { site: site })
      }
    end
  end

  def show
    @site = Site.find(params[:id])
    authorize @site
  end
end
