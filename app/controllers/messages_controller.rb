class MessagesController < ApplicationController

	def show
		if session[:user_id] == nil
			redirect_to root_url
		else
			@message_users = current_user.messages.where('id_user_to != ""').group(:id_user_to)
			@message_emails = current_user.messages.where('email_sending != ""').group(:email_sending)
		end
	end

	def create
		profile_user = User.find(params[:user_id])
		if session[:user_id] != nil
			profile_user.messages.create(message: params[:message],state: "UNREAD",date:  Time.now,id_user_to: current_user.id)
		else
			profile_user.messages.create(message: params[:message],state: "UNREAD",date:  Time.now, email_sending: params[:email])
			
		end
		redirect_to root_url
	end

	def message
		if session[:user_id] == nil
			redirect_to root_url
		else
			response = ""
			conversation = nil
			if params[:conversation].is_number?
				conversation = Message.where("user_id = ? AND id_user_to = ? OR user_id = ? AND id_user_to = ? ",params[:conversation] ,session[:user_id],session[:user_id],params[:conversation])
			else
				conversation = Message.where("user_id = ? AND email_sending = ?",session[:user_id],params[:conversation]+".com").order(:created_at)

			end
			conversation.each do |msg|
				response += "<p>"+ msg.message+"</p>"
				logger.debug "XD"

			end
			
			render :text => response
		end	
	end

end

class String
	  def is_number?
	    true if Float(self) rescue false
	  end
	end
