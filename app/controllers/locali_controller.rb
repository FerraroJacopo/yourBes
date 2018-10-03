class LocaliController < ApplicationController
	
	def index
		@citta = params[:citta]
		if @citta.nil?
			@locale = Locale.search(params[:search])
		else
			@locale = Locale.search(params[:search]).where("citta = ?", @citta)
		end
	end
	
	def new
		@locale = Locale.new
		@l=Locale.pluck(:nlocale)
		@c=City.pluck(:nomecity)
	end

	def show
		require 'net/http'
		@locale = Locale.find(params[:id])
		
		url = "https://maps.googleapis.com/maps/api/geocode/json?address="+ @locale.indirizzo + " " + @locale.citta + " italia&key=AIzaSyC0fhD6OKoePfBR6GTaT-9wZUYa6AtiOdM"
		uri = URI(url)
		response = Net::HTTP.get(uri)

		parsed= JSON.parse(response)
		@lat= parsed["results"][0]["geometry"]["location"]["lat"].to_s
		@lng= parsed["results"][0]["geometry"]["location"]["lng"].to_s

		@map= "https://maps.googleapis.com/maps/api/staticmap?center="+ @lat +","+ @lng + "&size=400x400&key=AIzaSyC0fhD6OKoePfBR6GTaT-9wZUYa6AtiOdM&zoom=17&markers="+ @lat +","+ @lng
	end

	def create
		@locale = Locale.new(locale_params)
		if @locale.save
			flash[:notice] = "locale creato"
			redirect_to action: "index"
		else flash[:notice] = "locale errato"
			render action: "new"
		end
	end

	private
	def locale_params
		params.require(:locale).permit(:nlocale, :indirizzo, :backline, :pagamento, :capacita, :genere, :telefono, :citta)
	end
end
