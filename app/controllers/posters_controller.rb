class PostersController < ApplicationController

  def index
    @posters = Poster.order('updated_at DESC')
  end

  def create
    @poster = Poster.new(params[:poster])
    if @poster.save
      flash[:success] = "Plakaten er laget."
    else
      flash[:error] = "Vennligst fyll ut alle felter."
      render :action => 'new'
    end
    redirect_to posters_path
  end

  def edit
    @poster = Poster.find(params[:id])
  end

  def update
    @poster = Poster.find(params[:id])
    if @poster.update_attributes(params[:poster])
      flash[:success] = "Plakaten er endret."
    else
      flash[:error] = "Noe gikk galt, endringene ble ikke lagret."
      render :action => 'edit'
    end
    redirect_to posters_path
  end

  def show
    @poster = Poster.find(params[:id])
  end

  def new
    @poster = Poster.new
  end

  def cancel
  end

  def take
  end

  def archive
    @posters = Poster.all
  end

  def archive_poster
    poster = Poster.find(params[:id])
    poster.archived = true
    poster.save
    flash[:success] = "Plakaten er arkivert."
    redirect_to posters_path
  end

  def unarchive_poster
    poster = Poster.find(params[:id])
    poster.archived = false
    poster.save
    flash[:success] = "Plakaten er gjennopprettet."
    redirect_to posters_path

  end

  def destroy
    Poster.destroy(params[:id])
    flash[:success] = "Plakaten er slettet."
    redirect_to posters_path
  end
end
