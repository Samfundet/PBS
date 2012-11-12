# -*- encoding : utf-8 -*-
class PostersController < ApplicationController
  filter_access_to [:edit, :update, :cancel_poster, :archive_poster, :restore], :attribute_check=>true

  def index
    @posters = Poster.where(:status => :active).order("#{sort_column} #{sort_order}")
  end

  def create
    @poster = Poster.new(params[:poster])
    @poster.orderer = @current_user
    @poster.status = :active
    @poster.assets
    if @poster.save
      flash[:success] = "Plakaten er laget."
      redirect_to posters_path
    else
      flash[:error] = "Vennligst fyll ut alle felter."
      render :action => 'new'
    end
  end

  def edit
    @poster = Poster.find(params[:id])
    5.times {@poster.assets.build}
  end

  def update
    @poster = Poster.find(params[:id])
    if @poster.update_attributes(params[:poster])
      PosterMailer.poster_changed(@poster).deliver
      flash[:success] = "Plakaten er endret."
      redirect_to posters_path
    else
      flash[:error] = "Noe gikk galt, endringene ble ikke lagret."
      render :action => 'edit'
    end
  end

  def show
    @poster = Poster.find(params[:id])
  end

  def new
    @poster = Poster.new
    @poster.orderer = @current_user
    5.times {
      @poster.assets.build
    }
  end

  def cancel_poster
    poster = Poster.find(params[:id])
    poster.status = :canceled
    if poster.save
      flash[:success] = "Plakaten er naa avbestilt"
      redirect_to posters_path
    else
      flash[:error] = "Noe gikk galt, plakaten er ikke avbestilt"
    end
  end

  def cancel
    @posters = Poster.where(:status => :canceled).order("#{sort_column} #{sort_order}")
  end

  def order
    @posters = Poster.where(:orderer_id => @current_user.id).order("#{sort_column} #{sort_order}")
  end

  def take
    @posters = Poster.where(:responsible_id => @current_user.id).order("#{sort_column} #{sort_order}")
  end

  def take_poster
    @poster = Poster.find(params[:id])
    @poster.responsible = @current_user
    if @poster.save
      PosterMailer.poster_taken(@poster).deliver
      flash[:success] = "Du er naa ansvarlig."
      redirect_to posters_path
    else
      flash[:error] = "Noe gikk galt, du ble ikke gjort til ansvarlig"
    end
  end

  def archive
    @posters = Poster.where(:status => :archived).order("#{sort_column} #{sort_order}")
  end

  def archive_poster
    poster = Poster.find(params[:id])
    poster.status = :archived
    if poster.save
      flash[:success] = "Plakaten er arkivert."
      redirect_to posters_path
    else
      flash[:error]  = "Noe gikk galt, plakaten er ikke arkivert"
    end
  end

  def restore
    poster = Poster.find(params[:id])
    poster.status = :active
    if poster.save
      flash[:success] = "Plakaten er gjenopprettet."
      redirect_to posters_path
    else
      flash[:error] = "Noe gikk galt, plakaten er ikke gjenopprettet."
     end
  end

  def destroy
    if Poster.destroy(params[:id])
      flash[:success] = "Plakaten er slettet."
      redirect_to posters_path
    else
      flash[:error] = "Noe gikk galt, plakaten er ikke slettet."
    end
  end

  private 
  def sort_column
    Poster.column_names.include?(params[:sort]) ? params[:sort] : 'updated_at'
  end

  def sort_order
    ['asc', 'desc'].include?(params[:order]) ? params[:order] : 'desc'
  end
end
