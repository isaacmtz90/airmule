class MessagesController < ApplicationController

	def new
		if session[:user_id] == nil
			redirect_to root_url
		end
	end

	def create
		profile_user = User.find(params[:user_id])
		if session[:user_id] != nil
			profile_user.messages.create(message: params[:message],state: "SEND",date:  Time.now,id_user_to: current_user.id)
		else
			profile_user.messages.create(message: params[:message],state: "SEND",date:  Time.now, email_sending: params[:email])
			
		end
		redirect_to root_url
	end

end
