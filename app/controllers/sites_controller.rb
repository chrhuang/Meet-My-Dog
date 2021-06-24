class SitesController < ApplicationController
  def index
    @sites = Site.geocoded
    @sites = policy_scope(Site).order(created_at: :desc)
    @markers = @sites.geocoded.map do |site|
      {
        lat: site.lat,
        lng: site.long,
        info_window: render_to_string(partial: "site_window", locals: { site: site }),
        image_url: helpers.asset_url('Component_2-removebg-preview.png')
      }
    end
  end

  def show
    @site = Site.find(params[:id])
    authorize @site
  end
end
