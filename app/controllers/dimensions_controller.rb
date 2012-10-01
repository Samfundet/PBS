class DimensionsController < ApplicationController
	def new
		dim = Dimension.new
		dim.text = "Dimension"
		dim.save
	end

	def index
		@dims = Dimension.all
	end

	def edit
	end

	def destroy
		@dim = Dimension.find(params[:id])
		@dim.destroy
    flash[:success] = "You have deleted #{@dim.text} med id: #{@dim.id}"
    redirect_to dimensions_path
	end
end
