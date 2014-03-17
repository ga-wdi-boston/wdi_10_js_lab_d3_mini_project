D3Visualizer::Application.routes.draw do
  root "towns#index"
  get "towns/index"
  get '/towns', to: 'towns#top_towns', as: 'top_towns'
end
