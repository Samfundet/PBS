# -*- encoding : utf-8 -*-
class PostersController < ApplicationController

  def index
    @posters = Poster.where(:status => :active).order('updated_at DESC')
  end

  def create
    @poster = Poster.new(params[:poster])
    @poster.orderer = @current_user
    @poster.status = :active
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
      PosterMailer.poster_changed(@poster).deliver
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
    poster.status = :canceled
    if poster.save
      flash[:success] = "Plakaten er naa avbestilt"
    else
      flash[:error] = "Noe gikk galt, plakaten er ikke avbestilt"
    end
    redirect_to posters_path
  end

  def cancel
    @posters = Poster.where(:status => :canceled).order('updated_at DESC')
  end

  def take
    @poster = Poster.find(params[:id])
    if @poster.responsible = @current_user
      @poster.save
      flash[:success] = "Du er naa ansvarlig."
    else
      flash[:error] = "Noe gikk galt, du ble ikke gjort til ansvarlig"
    end
    redirect_to posters_path
  end

  def archive
    @posters = Poster.where(:status => :archived).order('updated_at DESC')
  end

  def archive_poster
    poster = Poster.find(params[:id])
    poster.status = :archived
    if poster.save
      flash[:success] = "Plakaten er arkivert."
    else
      flash[:error]  = "Noe gikk galt, plakaten er ikke arkivert"
    end
    redirect_to posters_path
  end

  def restore
    poster = Poster.find(params[:id])
    poster.status = :active
    if poster.save
      flash[:success] = "Plakaten er gjenopprettet."
    else
      flash[:error] = "Noe gikk galt, plakaten er ikke gjenopprettet."
     end
    redirect_to posters_path
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
    flash[:success] = "Du er nå logget inn, #{@current_user.firstname} #{@current_user.surname}"
    redirect_to posters_path
  end

end
