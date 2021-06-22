class DogsController < ApplicationController
  def create
    authorize @dog
  end

  def destroy
    authorize @dog
  end

  def update
    authorize @dog
  end
end
