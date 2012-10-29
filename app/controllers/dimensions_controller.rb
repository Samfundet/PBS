# -*- encoding : utf-8 -*-
class DimensionsController < ApplicationController
	def new
		@dim = Dimension.new
	end

  def create
    @dim = Dimension.new(params[:dimension])
    if @dim.save
      flash[:success] = "Dimensjonen er laget."
      redirect_to dimensions_path
    else
      flash[:error] = "Vennligst fyll ut alle felter."
      redirect_to new_dimension_path(@dim)
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
    redirect_to dimension_path(@dim)
  end

	def destroy
		@dim = Dimension.find(params[:id])
		@dim.destroy
    flash[:success] = "You have deleted #{@dim.text} med id: #{@dim.id}"
    redirect_to dimensions_path
	end
end
