Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '464540060329220', 'f75c73e6012693bd4c2ec11782f31b53'
end