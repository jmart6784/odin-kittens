class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy]

  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json { render :json => @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def show
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @kitten }
    end
  end

  def edit
    
  end

  def update
    if @kitten.update(kitten_params)
      flash[:success] = "Sucessfully edited this kitten!"
      redirect_to @kitten
    else
      flash.now[:danger] = "Can't update this kitten. There are errors in your form."
      render "edit"
    end
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "Successfully created a kitten!"
      redirect_to @kitten
      puts "**********************************"
      puts "SUCESSFULLY CREATED"
      puts "**********************************"
    else 
      flash.now[:danger] = "Can't create this kitten. There are some errors in your form."
      render "new"
      puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
      puts "ERRORS FOUND"
      puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    end
  end

  def destroy
    flash[:info] = "#{@kitten.name} has been deleted."
    @kitten.destroy
    redirect_to root_path
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
