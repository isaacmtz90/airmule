class TripsController < ApplicationController
	def create
		current_user.trips.create(from_city: params[:from_city], from_country: params[:from_country], from_when: params[:from_when], to_city: params[:to_city],vto_country: params[:to_country], to_when: params[:to_when])
		#TODO: Redireccionar y mandar mensaje para el usuario
		redirect_to root_url

	end
end
