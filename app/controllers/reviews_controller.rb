class ReviewsController < ApplicationController
  def create
    @site = Site.find(params[:site_id])
    @review = Review.new(review_params)
    @review.site = @site
    if @review.save
      redirect_to site_path(@site)
    else
      render 'sites/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
