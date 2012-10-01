class DimensionController < ApplicationController
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

	def delete
		@dim = Dimension.find(params[:id])
		@dim.delete
	end
end
