Rails.application.routes.draw do
  root 'home#landing'
  get '/about', to: 'home#index'

  post '/send_email', to: 'home#send_email'

  get '/portfolio',                 to: 'portfolio#index'
  get '/portfolio/hookes',          to: 'portfolio#hookes'
  get '/portfolio/passive-capture', to: 'portfolio#passive_capture'
  get '/portfolio/tensor-flow',     to: 'portfolio#tensor_flow'
  get '/portfolio/discharge', to: 'portfolio#discharge'
end
