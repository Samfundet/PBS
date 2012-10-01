class DimentionsController < ApplicationController
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

	def destroy
		@dim = Dimention.find(params[:id])
		@dim.destroy
    flash[:success] = "You have deleted #{@dim.text} med id: #{@dim.id}"
    redirect_to dimentions_path
	end
end