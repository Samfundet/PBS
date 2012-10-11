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
    if poster.save
      flash[:success] = "Plakaten er naa avbestilt"
    else
      flash[:error] = "Noe gikk galt, plakaten er ikke avbestilt"
    end
    redirect_to posters_path
  end

  def cancel
    @posters = Poster.order('send_to_press DESC')
  end

  def take
    @poster = Poster.find(params[:id])
    if @poster.update_attributes(:member_id => "ANSVARLIG")
      flash[:success] = "Du er naa ansvarlig."
    else
      flash[:error] = "Noe gikk galt, du ble ikke gjort til ansvarlig"
    end
    redirect_to posters_path
  end

  def archive
    @posters = Poster.order('send_to_press DESC')
  end

  def archive_poster
    poster = Poster.find(params[:id])
    poster.archived = true
    if poster.save
      flash[:success] = "Plakaten er arkivert."
    else
      flash[:error]  = "Noe gikk galt, plakaten er ikke arkivert"
    end
    redirect_to posters_path
  end

  def restore_archived
    poster = Poster.find(params[:id])
    poster.archived = false
    poster.canceled = false
    if poster.save
      flash[:success] = "Plakaten er gjenopprettet."
    else
      flash[:error] = "Noe gikk galt, plakaten er ikke gjenopprettet."
     end
    redirect_to archive_posters_path
  end

  def restore_canceled
    poster = Poster.find(params[:id])
    poster.canceled = false
    if poster.save
      flash[:success] = "Plakaten er gjenopprettet."
    else
      flash[:error] = "Noe  gikk galt, plakaten er ikke gjenopprettet."
    end
    redirect_to cancel_posters_path
  end

  def destroy
    if Poster.destroy(params[:id])
      flash[:success] = "Plakaten er slettet."
    else
      flash[:error] = "Noe gikk galt, plakaten er ikke slettet."
    end
    redirect_to posters_path
  end

  def set_current_user
    session[:member_id] = params[:id]
    @current_user ||= Member.find(session[:member_id])
    flash[:success] = "Du er nå logget inn, #{@current_user.id}"
    redirect_to posters_path
  end

end
