Rails.application.routes.draw do
  root 'home#index'

  get '/portfolio',        to: 'portfolio#index'
  get '/portfolio/hookes', to: 'portfolio#hookes'
end
