class ReviewsController < ApplicationController
  def create
    event = Event.find(params["review"]["event_id"])
    site = event.walk.site
    review = Review.new(review_params)
    authorize review
    review.site = site
    review.event = event
    review.user = current_user
    if review.save
      redirect_to site_path(site, anchor: "review-#{review.id}")
    else
      render 'sites/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
