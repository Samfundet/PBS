# -*- encoding : utf-8 -*-
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

  def cancel_poster
    poster = Poster.find(params[:id])
    poster.canceled = true
    poster.save
    flash[:success] = "Plakaten er naa avbestilt"
    redirect_to posters_path
  end

  def cancel
    @posters = Poster.order('send_to_press DESC')
  end

  def take
    @poster = Poster.find(params[:id])
    @poster.update_attributes(:member_id => "ANSVARLIG")
    flash[:success] = "Du er naa ansvarlig."
    redirect_to posters_path
  end

  def archive
    @posters = Poster.order('send_to_press DESC')
  end

  def archive_poster
    poster = Poster.find(params[:id])
    poster.archived = true
    poster.save
    flash[:success] = "Plakaten er arkivert."
    redirect_to posters_path
  end

  def restore_archived
    poster = Poster.find(params[:id])
    poster.archived = false
    poster.canceled = false
    poster.save
    flash[:success] = "Plakaten er gjenopprettet."
    redirect_to archive_posters_path
  end

  def restore_canceled
    poster = Poster.find(params[:id])
    poster.canceled = false
    poster.save
    flash[:success] = "Plakaten er gjenopprettet."
    redirect_to cancel_posters_path
  end

  def destroy
    Poster.destroy(params[:id])
    flash[:success] = "Plakaten er slettet."
    redirect_to posters_path
  end
end
