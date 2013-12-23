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
			current_user.trips.create(from_city: params[:from_city], from_country: params[:from_country], from_when: Date.parse(params[:from_when]), to_city: params[:to_city],to_country: params[:to_country],to_when:  Date.parse(params[:to_when]))
			#TODO: mandar mensaje para el usuario
		end
		redirect_to root_url
	end
end
