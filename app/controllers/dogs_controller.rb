class DogsController < ApplicationController
  def new
  end

  def create
    dog = Dog.new(dog_params)
    dog.user = current_user
    authorize dog
    if dog.save
      redirect_to dashboard_path
    else
      render dashboard_path
    end
  end

  def update
    dog_id = params[:dog][:id]
    dog = Dog.find(dog_id)
    authorize dog
    dog.update(dog_params)
    redirect_to dashboard_path
  end

  def destroy
    id = params[:id]
    dog = Dog.find(id)
    authorize dog
    dog.destroy
    redirect_to dashboard_path
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :age, :size, :gender, :photo)
  end
end
