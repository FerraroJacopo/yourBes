class CittaController < ApplicationController
 	
   def index
  		@citta = City.select(:nomecity) 
  	end

  	def new
  		@citta= City.new
  	end

  	def create
  		@citta = City.new(params.require(:city).permit(:nomecity))
		if @citta.save
			flash[:notice] = "città creata"
			redirect_to action: "index"
		else flash[:notice] = "città errata"
			render action: "new"
		end
  	end

  	def show
  		@citta = City.find(params[:id]).nomecity
  		redirect_to controller: 'locali', action: 'index', citta: @citta
  	end

end
