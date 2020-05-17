class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def new
    
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def edit
    
  end

  def create
    
  end

  def destroy
    
  end
end
