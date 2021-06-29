class ReviewsController < ApplicationController
  def create
    @site = Site.find(params[:site_id])
    @review = Review.new(review_params)
    authorize @review
    @review.site = @site
    @review.user = current_user
    raise
    if @review.save
      redirect_to site_path(@site, anchor: "review-#{@review.id}")
    else
      render 'sites/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
