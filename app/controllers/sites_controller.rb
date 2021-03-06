class SitesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query] == ""
      @sites = Site.all
    else
      @sites = Site.near(params[:query], 20)
    end
    @search = params[:query]
    @sites = policy_scope(@sites)
    @markers = @sites.geocoded.map do |site|
      {
        lat: site.latitude,
        lng: site.longitude,
        info_window: render_to_string(partial: "info_window", locals: { site: site }),
        image_url: helpers.asset_url('3-removebg-preview.png')
      }
    end
  end

  def show
    @site = Site.find(params[:id])
    authorize @site
    @markers = []
    @markers << {
      lat: @site.latitude,
      lng: @site.longitude,
      info_window: render_to_string(partial: "info_window", locals: { site: @site }),
      image_url: helpers.asset_url('3-removebg-preview.png')
    }
    @review = Review.new
  end
end
