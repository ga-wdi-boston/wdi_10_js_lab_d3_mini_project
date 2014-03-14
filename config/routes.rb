D3Visualizer::Application.routes.draw do
  get "crimes/index"
  root "crimes#index"
end
