class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def edit
    
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.valid?
      flash[:notice] = "Successfully created #{@kitten.name}"
    else
      flash[:errors] = @kitten.errors.full_messages.to_sentence
    end

    # redirect_to @kitten
  end

  def destroy
    
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
