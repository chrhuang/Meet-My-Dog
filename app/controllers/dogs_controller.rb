class DogsController < ApplicationController
  def new
  end

  def create
    dog = Dog.new(dog_params)
    dog.user = current_user
    authorize dog
    if params["temperament"]
      params["temperament"].each do |_key, value|
        DogHasTemperament.create!(dog: dog, temperament_id: value)
      end
    end
    if dog.save
      redirect_to dashboard_path
    else
      render dashboard_path
    end
  end

  def update
    dog = Dog.find(params[:id])
    authorize dog
    tmp = DogHasTemperament.where(dog: dog)
    tmp.each { |t| t.destroy }

    if params["temperament"].present?
      params["temperament"].each do |_key, value|
        DogHasTemperament.create!(dog: dog, temperament_id: value)
      end
    end
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
    params.require(:dog).permit(:name, :age, :size, :gender, :photo, :temperament)
  end
end
