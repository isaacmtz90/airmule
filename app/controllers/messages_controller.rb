class MessagesController < ApplicationController

	def new
		if session[:user_id] == nil
			redirect_to root_url
		end
	end

end
