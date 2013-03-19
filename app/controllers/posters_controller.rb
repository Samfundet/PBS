# -*- encoding : utf-8 -*-
class PostersController < ApplicationController
  filter_access_to [:edit, :update, :cancel_poster, :archive_poster, :restore], :attribute_check=>true

  def index
    @posters = sort_posters Poster.where(:status => :active)
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
      flash[:error] = "Vennligst fyll ut alle felter korrekt."
      50.times {@poster.assets.build}
      render :action => 'new'
    end
  end

  def edit
    @poster = Poster.find(params[:id])
    50.times {@poster.assets.build}
  end

  def update
    @poster = Poster.find(params[:id])
    if @poster.update_attributes(params[:poster])
      PosterMailer.poster_changed(@poster).deliver
      flash[:success] = "Plakaten er endret."
      redirect_to posters_path
    else
      flash[:error] = "Noe gikk galt, endringene ble ikke lagret."
      50.times {@poster.assets.build}
      render :action => 'edit'
    end
  end

  def show
    @poster = Poster.find(params[:id])
  end

  def new
    @poster = Poster.new
    @poster.orderer = @current_user
    50.times {@poster.assets.build}
  end

  def cancel_poster
    poster = Poster.find(params[:id])
    poster.status = :canceled
    if poster.save
      flash[:success] = "Plakaten er nå avbestilt"
      redirect_to posters_path
    else
      flash[:error] = "Noe gikk galt, plakaten er ikke avbestilt"
    end
  end

  def cancel
    @posters = sort_posters Poster.where(:status => :canceled)
  end

  def order
    @posters = sort_posters Poster.where(:orderer_id => @current_user.id)
  end

  def take
    @posters = sort_posters Poster.where(:responsible_id => @current_user.id)
  end

  def take_poster
    @poster = Poster.find(params[:id])
    if @poster.responsible == @current_user
      @poster.responsible = nil
    else
      @poster.responsible = @current_user
      PosterMailer.poster_taken(@poster).deliver
      flash[:success] = "Du er nå ansvarlig."
    end
    @poster.save
    redirect_to posters_path
  end

  def archive
    @posters = sort_posters Poster.where(:status => :archived)
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

  def sort_posters(posters)
    @sort_column = params[:sort] || 'updated_at'
    @sort_order = ['asc', 'desc'].include?(params[:order]) ? params[:order] : 'desc'

    easy_sortable_columns = %w(
      id
      name
      poster_text
      description
      flyers
      banner
      status
      send_to_press
      event_time
      created_at
      updated_at
    )

    if easy_sortable_columns.include? @sort_column
      posters.order "#{@sort_column} #{@sort_order}"
    else
      case @sort_column
        when 'dimension_id'
          posters.includes(:dimension)
          posters.sort_by! { |p| p.dimension and p.dimension.text }
        when 'group_id'
          posters.includes(:group)
          posters.sort_by! { |p| p.group and p.group.name }
        when 'event_id'
          posters.includes(:event)
          posters.sort_by! { |p| p.event and p.event.title }
        when 'responsible_id'
          posters.includes(:responsible)
          posters.sort_by! { |p| p.responsible and p.responsible.full_name }
        when 'orderer_id'
          posters.includes(:orderer)
          posters.sort_by! { |p| p.orderer and p.orderer.full_name }
        else
          return posters.order "updated_at #{@sort_order}"
      end

      posters.reverse! if @sort_order == 'desc'
      posters
    end
  end
end
