D3Visualizer::Application.routes.draw do
  get "projects/index"
  root "projects#index"
end
