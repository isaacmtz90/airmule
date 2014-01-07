OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '738099589550780' , '13ef58d035c2801bd862ade8b848cd26', {image_size: 'large' , client_options: {ssl: {ca_file: Rails.root.join('lib/assets/cacert.pem').to_s}}}
 
end