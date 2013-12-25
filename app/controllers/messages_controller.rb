class MessagesController < ApplicationController
	#TODO: RENAME USER_TO , to USER_FROM
	#TODO: Deactivate mails from messages
	def show
		if session[:user_id] == nil
			redirect_to root_url
		else
			@message_users = current_user.messages.select("DISTINCT ON (id_user_to) *").where("id_user_to != ''  AND user_id::varchar != id_user_to ")
			@message_emails = current_user.messages.select("DISTINCT ON (email_sending) *").where("email_sending != '' ")
		end
	end

	def create
		if !params[:message].emtpy?
			profile_user = User.find(params[:user_id])
			if session[:user_id] != nil
				profile_user.messages.create(message: params[:message],state: "UNREAD",date:  Time.now,id_user_to: current_user.id)
				email_body = "Haz recibido un mensaje en Airmule: <br><br>" + params[:message]
				MessageMailer.reply_email(profile_user.email,email_body).deliver
				session[:message] = "Mensaje enviado exitosamente"
			else
				if !params[:email].emtpy?
					profile_user.messages.create(message: params[:message],state: "UNREAD",date:  Time.now, email_sending: params[:email])
					email_body = "Haz recibido un mensaje en Airmule: <br><br>" + params[:message]
					MessageMailer.reply_email(profile_user.email,email_body).deliver
					session[:message] = "Mensaje enviado exitosamente"
				end
			end	
		else
			session[:message] = "Error: No deje campos vacios"
		end
		
		redirect_to root_url
	end

	def reply_to_email
		if !params[:message].emtpy?
			profile_user = User.find(session[:user_id])
			profile_user.messages.create(message: params[:message],state: "UNREAD",date:  Time.now, email_sending: params[:email],id_user_to: session[:user_id])
			email_body = "Haz recibido un mensaje en Airmule de " + profile_user.email + ":<br><br>" + params[:message]
			MessageMailer.reply_email(params[:email],email_body).deliver
			session[:message] = "Mensaje enviado exitosamente"
		else
			session[:message] = "Error: No deje campos vacios"
		end
		
		redirect_to root_url
	end

	def reply_to_user
		if !params[:message].emtpy?
			profile_user = User.find( params[:user_id])
			profile_user.messages.create(message: params[:message],state: "UNREAD",date:  Time.now, id_user_to: session[:user_id])
			email_body = "Haz recibido un mensaje en Airmule: <br><br>" + params[:message]
			MessageMailer.reply_email(profile_user.email,email_body).deliver
			session[:message] = "Mensaje enviado exitosamente"
		else
			session[:message] = "Error: No deje campos vacios"
		end
		
		redirect_to root_url
	end

	def message
		replyRegisteredUSer = false;
		if session[:user_id] == nil 
			redirect_to root_url
		else
			response = "<div class='chat' id='chat-box'>"
			conversation = nil
			reply_user = 0
			if params[:conversation].is_number?
				replyRegisteredUSer = true;
				conversation = Message.where("user_id = '?' AND id_user_to = ? OR user_id = ? AND id_user_to = '?'",session[:user_id],params[:conversation] ,params[:conversation],session[:user_id])
				reply_user = params[:conversation]
			else
				conversation = Message.where("user_id = ? AND email_sending = ?",session[:user_id],params[:conversation]).order(:created_at)
				reply_user = params[:conversation]
			end
			
			conversation.each do |msg|
				clase = "right"
				if msg.user_id == session[:user_id] && msg.user_id.to_s != msg.id_user_to
					clase = "left"
					msg.update_attributes(state: "READ")	
				end
				response += "<div class='"+clase+" tooltip'><p>"+ msg.message+"</p><div class='tail1'></div><div class='tail2'></div></div>"

			end

			if replyRegisteredUSer
				response += "<form method='post' action='/messages/reply_to_user/"+reply_user+"'><textarea placeholder='Responder' id='message' name='message'></textarea><input type='submit' class='submit' value = 'Responder'><input type='hidden' name='" + request_forgery_protection_token.to_s + "' value='" + form_authenticity_token() +"'></form></div>"
			else
				response += "<form method='post' action='/messages/reply_to_email/"+reply_user+"'><textarea placeholder='Responder' id='message' name='message'></textarea><input type='submit' class='submit' value = 'Responder al correo'><input type='hidden' name='" + request_forgery_protection_token.to_s + "' value='" + form_authenticity_token() +"'></form></div>"
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
