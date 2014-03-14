D3Visualizer::Application.routes.draw do
  get "names/index"
  root to: "names#index"
end
