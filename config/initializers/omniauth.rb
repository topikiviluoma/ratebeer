Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['20113a16004694ffa026'], ENV['170c7b410085ef897c57ab242460a3080b7185ab']
end