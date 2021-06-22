class SitesController < ApplicationController
  def index
    @sites = policy_scope(Site).order(created_at: :desc)
  end

  def show
    @site = Site.find(params[:id])
    authorize @site
  end
end
