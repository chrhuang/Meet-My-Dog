class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @my_events = current_user.events.sort_by(&:date)
  end
end
