class DimentionController < ApplicationController
	def new
		dim = Dimention.new
		dim.text = "Dimention"
		dim.save
	end

	def index
		@dims = Dimention.all
	end

	def edit
	end

	def delete
		@dim = Dimention.find(params[:id])
		@dim.delete
	end
end