D3Visualizer::Application.routes.draw do
  get "towns/index"
  root "towns#index"
end
