OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'] , ENV['FACEBOOK_SECRET'], {image_size: 'large' , client_options: {ssl: {ca_file: Rails.root.join('lib/assets/cacert.pem').to_s}}}
 
end