class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to kitten_path(@kitten), notice: "Kitten created"
    else
      flash.now[:alert] = "Kitten could not be created"
      render new
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
  end
  
  def edit
    @kitten = Kitten.find(params[:id])
  end
  
  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      redirect_to kitten_path(@kitten), notice: "Kitten updated"
    else
      flash.now[:alert] = "Kitten could not be updated"
      render edit
    end
  end

  def destroy
    Kitten.find(params[:id]).destroy
    redirect_to kittens_path, notice: "Kitten destroyed"
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
