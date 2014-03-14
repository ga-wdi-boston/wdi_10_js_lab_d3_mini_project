D3Visualizer::Application.routes.draw do
  get "main/index"
  get "countries/index"
  root to: 'main#index'
end
