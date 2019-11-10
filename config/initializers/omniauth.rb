Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, 'eced1a83ae6327f4478e', '1cec57000ef9a6feef7d27873f7a744015bd581e'
end