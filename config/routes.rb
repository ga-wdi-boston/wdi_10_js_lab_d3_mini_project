D3Visualizer::Application.routes.draw do
  get "main/index"
  get "countries/", to: "countries#index"
  get "countries/:id", to: "countries#show"
  root to: 'main#index'
end
