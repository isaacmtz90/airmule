class MessageMailer < ActionMailer::Base
  default from: "no-reply@airmule.com"

   def reply_email(email,message)
    @url  = 'http://airmule.heroku.com'
    mail(to: email,
         body: message,
         content_type: "text/html",
         subject: "Mensaje Airmule")
  end
end
