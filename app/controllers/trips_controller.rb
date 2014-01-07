class TripsController < ApplicationController
	def new
		if session[:user_id] == nil
			redirect_to root_url
		end
	end

	def create
		if session[:user_id] != nil
			logger.debug "WTFFFF"
			logger.debug params[:from_when]
			logger.debug params[:to_when]
			if !( params[:from_city].empty? && params[:from_country].empty? && params[:from_when].empty? && params[:to_city].empty? && params[:to_country].empty? && params[:to_when].empty?)
				current_user.trips.create(from_city: params[:from_city], from_country: params[:from_country], from_when: Date.parse(params[:from_when]), to_city: params[:to_city],to_country: params[:to_country],to_when:  Date.parse(params[:to_when]))
				session[:message] = "Viaje creado exitosamente"
			else
				session[:message] = "Error: ingrese correctamente todos los valores"
			end
			#TODO: mandar mensaje para el usuario
		end
		redirect_to root_url
	end

	def edit

		@trip = Trip.find(params[:trip_id])
		
	end		

	def show_by_user 
		if session[:user_id] != nil
			logger.debug "WTFFFF"
			logger.debug params[:from_when]
			logger.debug params[:to_when]
			@loggeduser = User.find(params[:user_id])
			@trips= @loggeduser.trips
			logger.debug @trips
			
			#TODO: mandar mensaje para el usuario
		end

	end
end
