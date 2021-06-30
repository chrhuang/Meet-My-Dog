import "jquery-bar-rating";

const initStarRating = () => {
    $('#event_2_review_rating').barrating({
        theme: 'css-stars'
      });
  };

export { initStarRating };