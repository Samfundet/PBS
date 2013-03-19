# -*- encoding : utf-8 -*-
class DimensionsController < ApplicationController
	def new
		@dim = Dimension.new
	end

  def create
    @dim = Dimension.new(params[:dimension])
    @dim.status = true
    if @dim.save
      flash[:success] = "Dimensjonen er laget."
      redirect_to dimensions_path
    else
      render :new
    end
  end


	def index
    @dims = Dimension.all
	end

  def show
    @dim = Dimension.find(params[:id])
  end

	def edit
    @dim = Dimension.find(params[:id])
	end

  def update
    @dim = Dimension.find(params[:id])
    @dim.text = params[:dimension][:text]
    @dim.save
    redirect_to dimensions_path
  end

  def archive_dimension
    dim = Dimension.find(params[:id])
    dim.status = false
    if dim.save
      flash[:success] = "Dimensjonen #{dim} er nå arkivert."
      redirect_to dimensions_path
    else
      flash[:error]  = "Noe gikk galt, dimensjonen er ikke arkivert"
    end
  end

  def restore
    dim = Dimension.find(params[:id])
    dim.status = true
    if dim.save
      flash[:success] = "Dimensjonen #{dim} er nå gjenopprettet."
      redirect_to dimensions_path
    else
      flash[:error] = "Noe gikk galt, dimensjonen er ikke gjenopprettet."
    end
  end

	def destroy
	end
end
