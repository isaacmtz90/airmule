class StaticController < ApplicationController
	def index 
		@mensaje = nil
		if session[:message]
			@mensaje = session[:message]
			session.delete(:message)
		end
		
	end
end
