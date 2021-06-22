class DogsController < ApplicationController
  def new
    @dog = Dog.new
    authorize @dog
  end

  def create
    dog = Dog.new(dog_params)
    dog.user = current_user
    authorize dog
    if dog.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    id = params[:id]
    @dog = Dog.find(id)
    authorize @dog
  end

  def update
    id = params[:id]
    @dog = Dog.find(id)
    authorize @dog
    @dog.update(dog_params)
    redirect_to dashboard_path
  end

  def destroy
    id = params[:id]
    dog = Dog.find(id)
    authorize @dog
    dog.destroy
    redirect_to dashboard_path
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :age, :size, :gender, :photo_key, :user_id)
  end
end
