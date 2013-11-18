OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '464540060329220', 'f75c73e6012693bd4c2ec11782f31b53', {image_size: 'large' , client_options: {ssl: {ca_file: Rails.root.join('lib/assets/cacert.pem').to_s}}}
end