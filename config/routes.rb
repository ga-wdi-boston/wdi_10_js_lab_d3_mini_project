D3Visualizer::Application.routes.draw do

  get "delays/index"
  get "carriers/index"
  root "carriers#index"
end
