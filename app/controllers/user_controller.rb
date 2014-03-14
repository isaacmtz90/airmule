class UserController < ApplicationController
	def show
		@profile_user = User.find(params[:user_id])
	end

	def delete
		if session[:user_id] != nil
			@loggeduser = User.find(session[:user_id] )
			if @loggeduser
				@loggeduser.destroy()
				session[:user_id] = nil
				session[:message] = "Se ha borrado tu cuenta exitosamente"
			end
			
		end
		redirect_to root_url
	end	

	def edit 
		if session[:user_id] != nil
			@loggeduser = User.find(session[:user_id])
			@trips = @loggeduser.trips
			if @trips.blank?
			end
			#TODO: mandar mensaje para el usuario
		end

	end
end
