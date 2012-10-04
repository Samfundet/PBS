class PostersController < ApplicationController

  def index
    @posters=Posters.all
  end

  def create
    @poster = Poster.new(params[:poster])
    if @poster.save
      flash[:success] = "Plakaten er laget."
    else
      flash[:error] = "Vennligst fyll ut alle felter."
      render :action => 'new'
    end
  end

  def update
  end

  def show
  end

  def new
    @poster = Poster.new
  end

  def edit
  end

  def cancel
  end

  def take
  end

  def archive
  end

  def delete
  end
end
