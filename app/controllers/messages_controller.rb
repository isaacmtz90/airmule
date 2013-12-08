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

	def reply_mail
		profile_user = User.find(session[:user_id])
		profile_user.messages.create(message: params[:message],state: "UNREAD",date:  Time.now, email_sending: params[:email]+".com")
		redirect_to root_url
	end

	def message
		if session[:user_id] == nil
			redirect_to root_url
		else
			response = "<div class='chat'>"
			conversation = nil
			reply_user = 0
			if params[:conversation].is_number?
				conversation = Message.where("user_id = ? AND id_user_to = ? OR user_id = ? AND id_user_to = ? ",params[:conversation] ,session[:user_id],session[:user_id],params[:conversation])
				reply_user = params[:conversation]
			else
				conversation = Message.where("user_id = ? AND email_sending = ?",session[:user_id],params[:conversation]+".com").order(:created_at)
				reply_user = params[:conversation]+".com"
			end
			
			conversation.each do |msg|
				response += "<p>"+ msg.message+"</p>"

			end

			response += "<form method='post' action='/messages/reply_mail/"+reply_user+"'><textarea placeholder='Responder' id='message' name='message'></textarea><input type='submit' class='submit' value = 'Enviar'><input type='hidden' name='" + request_forgery_protection_token.to_s + "' value='" + form_authenticity_token() +"'></form></div>"
			
			render :text => response
		end	
	end

end

class String
	  def is_number?
	    true if Float(self) rescue false
	  end
	end
