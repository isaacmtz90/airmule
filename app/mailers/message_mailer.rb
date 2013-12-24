class MessageMailer < ActionMailer::Base
  default from: "no-reply@airmule.com"

   def reply_email(email)
    @url  = 'http://airmule.com'
    mail(to: email,
         body: "email_body",
         content_type: "text/html",
         subject: "Mensaje Airmule")
  end
end
